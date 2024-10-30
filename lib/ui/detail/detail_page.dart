import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:anime_movie/model/anime_movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

var informationTextStyle = const TextStyle(
  fontFamily: 'Oxygen',
  color: Colors.white70,
);

class DetailPage extends StatefulWidget {
  final AnimeMovie movie;
  final Set<String> bookmarkedMovies;
  final Function(String) onToggleBookmark;

  const DetailPage({
    Key? key,
    required this.movie,
    required this.bookmarkedMovies,
    required this.onToggleBookmark,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.bookmarkedMovies
        .contains(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return constraints.maxWidth > 800
            ? DetailWebPage(
                movie: widget.movie,
                isBookmarked: isBookmarked,
                toggleBookmark: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                    widget.onToggleBookmark(widget.movie.id);
                  });
                },
              )
            : DetailMobilePage(
                movie: widget.movie,
                isBookmarked: isBookmarked,
                toggleBookmark: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                    widget.onToggleBookmark(widget.movie.id);
                  });
                },
              );
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final AnimeMovie movie;
  final bool isBookmarked;
  final VoidCallback toggleBookmark;

  const DetailMobilePage({
    Key? key,
    required this.movie,
    required this.isBookmarked,
    required this.toggleBookmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          movie.title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.lightGreen),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.yellow : Colors.white,
            ),
            onPressed: toggleBookmark,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
                child: CachedNetworkImage(
                  imageUrl: movie.imageAsset,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child:
                          CircularProgressIndicator(color: Colors.lightGreen)),
                  errorWidget: (context, url, error) => const Center(
                      child: Text('Image not available',
                          style: TextStyle(color: Colors.red))),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontFamily: 'Staatliches',
                      color: Colors.white),
                ),
              ),
              _buildInfoRow(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  movie.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Oxygen',
                      color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: movie.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.lightGreen)),
                          errorWidget: (context, url, error) => const Center(
                              child: Text('Image not available',
                                  style: TextStyle(color: Colors.red))),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildInfoColumn(Icons.calendar_today, movie.year),
        _buildInfoColumn(Icons.person, movie.directors.join(', ')),
        _buildInfoColumn(Icons.star_rate, movie.rating),
      ],
    );
  }

  Column _buildInfoColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.white),
        const SizedBox(height: 8.0),
        Text(text, style: informationTextStyle),
      ],
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final AnimeMovie movie;
  final bool isBookmarked;
  final VoidCallback toggleBookmark;

  const DetailWebPage({
    Key? key,
    required this.movie,
    required this.isBookmarked,
    required this.toggleBookmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      imageWidget = Image.network(
        movie.imageAsset,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(
            child: Text('Image not available',
                style: TextStyle(color: Colors.red))),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
              child: CircularProgressIndicator(color: Colors.lightGreen));
        },
      );
    } else {
      imageWidget = CachedNetworkImage(
        imageUrl: movie.imageAsset,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(color: Colors.lightGreen)),
        errorWidget: (context, url, error) => const Center(
            child: Text('Image not available',
                style: TextStyle(color: Colors.red))),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title:
            const Text('Anime Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.lightGreen),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.yellow : Colors.white,
            ),
            onPressed: toggleBookmark,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 34.0,
                    fontFamily: 'Staatliches',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Center(child: imageWidget),
              const SizedBox(height: 16),
              _buildInfoRow(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  movie.description,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Oxygen',
                      color: Colors.white70),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildInfoColumn(Icons.calendar_today, movie.year),
        _buildInfoColumn(Icons.person, movie.directors.join(', ')),
        _buildInfoColumn(Icons.star_rate, movie.rating),
      ],
    );
  }

  Column _buildInfoColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.white),
        const SizedBox(height: 8.0),
        Text(text, style: informationTextStyle),
      ],
    );
  }
}
