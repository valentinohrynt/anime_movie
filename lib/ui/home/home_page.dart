import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:anime_movie/ui/detail/detail_page.dart';
import 'package:anime_movie/model/anime_movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<String> bookmarkedMovies = {};
  bool showBookmarks = false;

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  void toggleBookmark(String id) {
    setState(() {
      if (bookmarkedMovies.contains(id)) {
        bookmarkedMovies.remove(id);
      } else {
        bookmarkedMovies.add(id);
      }
      _saveBookmarks();
    });
  }

  Future<void> _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarks = prefs.getStringList('bookmarkedMovies');
    if (bookmarks != null) {
      bookmarkedMovies = bookmarks.toSet();
    }
    setState(() {});
  }

  Future<void> _saveBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarkedMovies', bookmarkedMovies.toList());
  }

  void toggleFilter(bool isBookmark) {
    setState(() {
      showBookmarks = isBookmark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Anime Movie',
          style: TextStyle(
            fontFamily: 'Staatliches',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    onPressed: () => toggleFilter(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showBookmarks ? Colors.grey : Colors.lightGreen,
                    ),
                    child: const Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    onPressed: () => toggleFilter(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showBookmarks ? Colors.lightGreen : Colors.grey,
                    ),
                    child: const Text(
                      'Bookmarks',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final moviesToShow = showBookmarks
                    ? animeMovieList
                        .where((movie) => bookmarkedMovies.contains(movie.id))
                        .toList()
                    : animeMovieList;

                if (constraints.maxWidth <= 600) {
                  return AnimeMovieList(
                    onToggleBookmark: toggleBookmark,
                    bookmarkedMovies: bookmarkedMovies,
                    movies: moviesToShow,
                  );
                } else if (constraints.maxWidth <= 1200) {
                  return AnimeMovieGrid(
                    gridCount: 4,
                    onToggleBookmark: toggleBookmark,
                    bookmarkedMovies: bookmarkedMovies,
                    movies: moviesToShow,
                  );
                } else {
                  return AnimeMovieGrid(
                    gridCount: 6,
                    onToggleBookmark: toggleBookmark,
                    bookmarkedMovies: bookmarkedMovies,
                    movies: moviesToShow,
                  );
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

class AnimeMovieGrid extends StatelessWidget {
  final int gridCount;
  final Set<String> bookmarkedMovies;
  final Function(String) onToggleBookmark;
  final List<AnimeMovie> movies;

  const AnimeMovieGrid({
    Key? key,
    required this.gridCount,
    required this.bookmarkedMovies,
    required this.onToggleBookmark,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final isBookmarked = bookmarkedMovies.contains(movie.id);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DetailPage(
                    movie: movie,
                    bookmarkedMovies: bookmarkedMovies,
                    onToggleBookmark: onToggleBookmark,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Card(
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 6,
              shadowColor: Colors.lightGreen,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15)),
                          child: kIsWeb
                              ? Image.network(
                                  movie.imageAsset,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(
                                    child: Text('Image not available',
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.lightGreen),
                                    );
                                  },
                                )
                              : CachedNetworkImage(
                                  imageUrl: movie.imageAsset,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.lightGreen),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Text('Image not available',
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          'Rating: ${movie.rating}',
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? Colors.yellow : Colors.white,
                      ),
                      onPressed: () => onToggleBookmark(movie.id),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimeMovieList extends StatelessWidget {
  final Set<String> bookmarkedMovies;
  final Function(String) onToggleBookmark;
  final List<AnimeMovie> movies;

  const AnimeMovieList({
    Key? key,
    required this.bookmarkedMovies,
    required this.onToggleBookmark,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final isBookmarked = bookmarkedMovies.contains(movie.id);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    DetailPage(
                  movie: movie,
                  bookmarkedMovies: bookmarkedMovies,
                  onToggleBookmark: onToggleBookmark,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Card(
            color: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            elevation: 3,
            shadowColor: Colors.lightGreen,
            child: ListTile(
              leading: SizedBox(
                width: 60,
                height: 90,
                child: kIsWeb
                    ? Image.network(
                        movie.imageAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text('Image not available',
                              style: TextStyle(color: Colors.red)),
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(
                                color: Colors.lightGreen),
                          );
                        },
                      )
                    : CachedNetworkImage(
                        imageUrl: movie.imageAsset,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                              color: Colors.lightGreen),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Text('Image not available',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ),
              ),
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'Rating: ${movie.rating}',
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.yellow : Colors.white,
                ),
                onPressed: () => onToggleBookmark(movie.id),
              ),
            ),
          ),
        );
      },
    );
  }
}
