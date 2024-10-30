class AnimeMovie {
  String id;
  String title;
  List<String> directors;
  String year;
  String rating;
  String description;
  String imageAsset;
  List<String> imageUrls;
  bool isBookmarked;

  AnimeMovie(
      {
      required this.id,
      required this.title,
      required this.directors,
      required this.year,
      required this.rating,
      required this.description,
      required this.imageAsset,
      required this.imageUrls,
      this.isBookmarked = false});
}

var animeMovieList = [
  AnimeMovie(
    id: "1",
    title: 'A Silent Voice',
    directors: ['Taichi Ishidate', 'Naoko Yamada'],
    year: '2016',
    rating: '8.93',
    description:
        'A Silent Voice: The Movie (Jepang: 映画 聲の形, Hepburn: Eiga Koe no Katachi, juga diterjemahkan sebagai The Shape of Voice: The Movie) adalah sebuah film drama remaja animasi Jepang tahun 2016 yang diproduksi oleh Kyoto Animation, disutradarai oleh Naoko Yamada dan ditulis oleh Reiko Yoshida, menampilkan desain karakter karya Futoshi Nishiya dan musik karya Kensuke Ushio. Film ini diadaptasi dari manga berjudul sama yang ditulis dan diilustrasikan oleh Yoshitoki Ōima. Film ini diputar perdana di Jepang pada tanggal 17 September 2016 dan di seluruh dunia antara bulan Februari dan Juni 2017.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BOTFiNzRiOWEtYTQwNy00NmRiLWE0ZWYtNTE0YjExZjFmZjkwXkEyXkFqcGc@._V1_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/8/302316.jpg',
      'https://cdn.myanimelist.net/images/characters/5/302315.jpg',
      'https://cdn.myanimelist.net/images/characters/10/330472.jpg',
      'https://cdn.myanimelist.net/images/characters/2/316403.jpg',
      'https://cdn.myanimelist.net/images/characters/8/385642.jpg',
      'https://cdn.myanimelist.net/images/characters/10/324718.jpg',
      'https://cdn.myanimelist.net/images/characters/8/330357.jpg',
      'https://cdn.myanimelist.net/images/characters/6/330353.jpg',
      'https://cdn.myanimelist.net/images/characters/16/330358.jpg',
      'https://cdn.myanimelist.net/images/characters/11/337967.jpg'
    ],
  ),
  AnimeMovie(
    id: "2",
    title: 'Your Name.',
    directors: ['Makoto Shinkai'],
    year: '2016',
    rating: '8.83',
    description:
        'Your Name. (Jepang: 君の名は。; Romaji: Kimi no Na wa; harfiah: "Namamu.") adalah sebuah film anime Jepang produksi tahun 2016 bergenre fantasi yang ditulis dan disutradarai oleh Makoto Shinkai dan diproduksi oleh CoMix Wave Films.[3] Perancangan tokoh film ini dikerjakan oleh Masayoshi Tanaka, dan penciptaan musik dibuat oleh band rock asal Jepang Radwimps. Film ini dibuat berdasarkan novel karya Makoto Shinkai berjudul sama yang dirilis sebulan sebelum pemutaran perdananya tentang seorang siswi di pedesaan Jepang dan seorang siswa di Tokyo yang saling bertukar tubuh.[4] Film ini dibintangi oleh Ryunosuke Kamiki, Mone Kamishiraishi, Masami Nagasawa dan Etsuko Ichihara.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BMjI1ODZkYTgtYTY3Yy00ZTJkLWFkOTgtZDUyYWM4MzQwNjk0XkEyXkFqcGc@._V1_FMjpg_UY12000_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/5/336342.jpg',
      'https://cdn.myanimelist.net/images/characters/6/311593.jpg',
      'https://cdn.myanimelist.net/images/characters/13/484502.jpg',
      'https://cdn.myanimelist.net/images/characters/13/341157.jpg',
      'https://cdn.myanimelist.net/images/characters/15/484499.jpg',
      'https://cdn.myanimelist.net/images/characters/14/346435.jpg',
      'https://cdn.myanimelist.net/images/characters/8/484504.jpg',
      'https://cdn.myanimelist.net/images/characters/9/306635.jpg',
      'https://cdn.myanimelist.net/images/characters/7/484495.jpg',
      'https://cdn.myanimelist.net/images/characters/12/346443.jpg',
      'https://cdn.myanimelist.net/images/characters/3/306633.jpg',
      'https://cdn.myanimelist.net/images/characters/15/346439.jpg',
      'https://cdn.myanimelist.net/images/characters/16/306637.jpg',
      'https://cdn.myanimelist.net/images/characters/9/346437.jpg',
      'https://cdn.myanimelist.net/images/characters/6/209419.jpg'
    ],
  ),
  AnimeMovie(
    id: "3",
    title: 'Violet Evergarden: The Movie',
    directors: ['Taichi Ishidate'],
    year: '2020',
    rating: '8.85',
    description:
        'Violet Evergarden: The Movie (Jepang: 劇場版 ヴァイオレット・エヴァーガーデン, Hepburn: Gekijōban Vaioretto Evāgāden) adalah film animasi Jepang tahun 2020 yang didasarkan pada seri novel ringan Violet Evergarden karya Kana Akatsuki dan sekuel dari adaptasi seri televisi anime 2018.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BZjBhZjZiOWMtYTgwZi00YjU1LWI3ODgtYjZiN2JhMzlkMjc0XkEyXkFqcGc@._V1_FMjpg_UY6551_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/9/345616.jpg',
      'https://cdn.myanimelist.net/images/characters/7/409286.jpg',
      'https://cdn.myanimelist.net/images/characters/3/494475.jpg',
      'https://cdn.myanimelist.net/images/characters/9/494253.jpg',
      'https://cdn.myanimelist.net/images/characters/2/494441.jpg',
      'https://cdn.myanimelist.net/images/characters/5/348991.jpg',
      'https://cdn.myanimelist.net/images/characters/8/494224.jpg',
      'https://cdn.myanimelist.net/images/characters/8/494474.jpg',
      'https://cdn.myanimelist.net/images/characters/12/457928.jpg'
    ],
  ),
  AnimeMovie(
    id: "4",
    title: 'Sword Art Online the Movie: Progressive - Aria of a Starless Night',
    directors: ['Ayako Kouno'],
    year: '2021',
    rating: '7.96',
    description:
        'Sword Art Online The Movie: Progressive - Aria of a Starless Night (劇場版 ソードアート・オンライン -プログレッシブ- 星なき夜のアリア, Gekijōban Sōdo Āto Onrain -Puroguresshibu- Hoshi no Nai Yoru no Aria) adalah film petualangan aksi fiksi ilmiah animasi Jepang tahun 2021 berdasarkan novel Sword Art Online yang ditulis oleh Reki Kawahara dan diilustrasikan oleh abec. Film ini diproduksi oleh A-1 Pictures dan disutradarai oleh Ayako Kawano, dan merupakan bagian resmi dari alur cerita Sword Art Online, menampilkan desain karakter oleh Kento Toya dan musik oleh Yuki Kajiura. Ini adalah film kedua setelah Sword Art Online The Movie: Ordinal Scale dari serial Sword Art Online. Film ini menggambarkan kisah pertemuan antara Kirito dan Asuna, meliput peristiwa di lantai pertama Aincrad, khususnya perjuangan awal Asuna untuk menghadapi realitas dunia barunya, yaitu yang ditulis dari sudut pandang Asuna.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BMGY5ZDFjZTQtNDVhMi00NzRhLTgwYzAtMmQyN2VlZTdjYjM0XkEyXkFqcGc@._V1_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/7/204821.jpg',
      'https://cdn.myanimelist.net/images/characters/15/262053.jpg',
      'https://cdn.myanimelist.net/images/characters/15/457713.jpg',
      'https://cdn.myanimelist.net/images/characters/14/177109.jpg',
      'https://cdn.myanimelist.net/images/characters/5/166545.jpg',
      'https://cdn.myanimelist.net/images/characters/2/192505.jpg',
      'https://cdn.myanimelist.net/images/characters/7/177117.jpg',
      'https://cdn.myanimelist.net/images/characters/8/297087.jpg',
      'https://cdn.myanimelist.net/images/characters/2/178383.jpg',
      'https://cdn.myanimelist.net/images/characters/4/174903.jpg'
    ],
  ),
  AnimeMovie(
    id: "5",
    title: 'Jujutsu Kaisen 0',
    directors: ['Sunghoo Park'],
    year: '2021',
    rating: '8.42',
    description:
        'Gekijō-ban Jujutsu Kaisen 0 (劇場版 呪術廻戦 0, "Jujutsu Kaisen 0 the Movie") adalah sebuah film anime beraliran fantasi gelap yang berdasarkan seri manga bertajuk Jujutsu Kaisen 0 sebuah prekuel dari seri Jujutsu Kaisen, keduanya dibuat oleh Gege Akutami. Film yang diproduksi oleh MAPPA dan didistribusikan oleh Toho ini akan tayang perdana di bioskop Jepang pada 24 Desember 2021.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BMzNhZTdmNDYtNTA0NC00MmNmLWIzYjUtNjg5NzNlYWQ0N2E5XkEyXkFqcGc@._V1_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/15/422168.jpg',
      'https://cdn.myanimelist.net/images/characters/3/440469.jpg',
      'https://cdn.myanimelist.net/images/characters/4/521636.jpg',
      'https://cdn.myanimelist.net/images/characters/10/461503.jpg',
      'https://cdn.myanimelist.net/images/characters/4/524519.jpg',
      'https://cdn.myanimelist.net/images/characters/16/423950.jpg',
      'https://cdn.myanimelist.net/images/characters/3/427139.jpg',
      'https://cdn.myanimelist.net/images/characters/5/427604.jpg',
      'https://cdn.myanimelist.net/images/characters/5/431905.jpg',
      'https://cdn.myanimelist.net/images/characters/8/435405.jpg'
    ],
  ),
  AnimeMovie(
    id: "6",
    title: 'Josee, the Tiger and the Fish',
    directors: ['Kôtarô Tamura'],
    year: '2020',
    rating: '8.39',
    description:
        'Josee, the Tiger and the Fish (ジョゼと虎と魚たち, Joze to Tora to Sakanatachi) adalah film animasi drama komedi romantis Jepang tahun 2020, yang berdasarkan dari cerita pendek dan novel remaja dengan nama yang sama oleh Seiko Tanabe. Film ini dibintangi oleh pengisi suara Taishi Nakagawa dan Kaya Kiyohara.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BN2IwMDQ4ZTEtMzMxNy00NDY3LWEzYzItZjA5MTFkOWRiOThmXkEyXkFqcGc@._V1_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/10/441918.jpg',
      'https://cdn.myanimelist.net/images/characters/6/458135.jpg',
      'https://cdn.myanimelist.net/images/characters/7/458137.jpg',
      'https://cdn.myanimelist.net/images/characters/2/458134.jpg',
      'https://cdn.myanimelist.net/images/characters/12/458123.jpg',
      'https://cdn.myanimelist.net/images/characters/5/458136.jpg'
    ],
  ),
  AnimeMovie(
    id: "7",
    title: 'Spy x Family Code: White',
    directors: ['Kazuhiro Furuhashi', 'Takashi Katagiri'],
    year: '2023',
    rating: '8.15',
    description:
        'Spy x Family Code: White adalah film animasi aksi komedi mata-mata Jepang 2023 yang disutradarai oleh Takashi Katagiri dari skenario oleh Ichirō Ōkouchi dan diproduksi oleh Wit Studio dan CloverWorks. Ini berdasarkan seri manga shōnen Spy × Family oleh Tatsuya Endo.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BNDIyMzM4NDgtMzA4Mi00ODFhLThjOTItYjk1N2RkZWViMTJmXkEyXkFqcGc@._V1_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/4/457933.jpg',
      'https://cdn.myanimelist.net/images/characters/11/457934.jpg',
      'https://cdn.myanimelist.net/images/characters/2/457747.jpg',
      'https://cdn.myanimelist.net/images/characters/6/490843.jpg',
      'https://cdn.myanimelist.net/images/characters/14/528424.jpg',
      'https://cdn.myanimelist.net/images/characters/6/528425.jpg',
      'https://cdn.myanimelist.net/images/characters/11/495209.jpg',
      'https://cdn.myanimelist.net/images/characters/4/494104.jpg',
      'https://cdn.myanimelist.net/images/characters/6/484493.jpg',
      'https://cdn.myanimelist.net/images/characters/3/528426.jpg'
    ],
  ),
  AnimeMovie(
    id: "8",
    title: 'Rascal Does Not Dream of a Dreaming Girl',
    directors: ['Sôichi Masui'],
    year: '2019',
    rating: '8.93',
    description:
        'Rascal Does Not Dream of a Dreaming Girl is a 2019 Japanese animated romantic supernatural drama film based on the sixth and seventh volumes of the light novel series Rascal Does Not Dream written by Hajime Kamoshida and illustrated by Kēji Mizoguchi. It is a sequel to the anime television series Rascal Does Not Dream of Bunny Girl Senpai, which adapts the first five volumes of the series. The film was originally released in June 2019 in Japan, and received limited theatrical releases in other regions in late 2019. A sequel film, Rascal Does Not Dream of a Sister Venturing Out, was released in 2023.',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BNGE4OWVlMTgtZDMzMC00ZTVhLWFkZWMtMGZkYjg5Yjg0YmVjXkEyXkFqcGc@._V1_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/2/366639.jpg',
      'https://cdn.myanimelist.net/images/characters/11/398261.jpg',
      'https://cdn.myanimelist.net/images/characters/12/361766.jpg',
      'https://cdn.myanimelist.net/images/characters/11/361763.jpg',
      'https://cdn.myanimelist.net/images/characters/7/366710.jpg',
      'https://cdn.myanimelist.net/images/characters/12/361762.jpg',
      'https://cdn.myanimelist.net/images/characters/11/398265.jpg',
      'https://cdn.myanimelist.net/images/characters/11/373251.jpg',
      'https://cdn.myanimelist.net/images/characters/10/373170.jpg',
      'https://cdn.myanimelist.net/images/characters/5/373176.jpg'
    ],
  ),
  AnimeMovie(
    id: "9",
    title: 'Re:ZERO -Starting Life in Another World- The Frozen Bond',
    directors: ['Masaharu Watanabe', 'Kenichi Kawamura'],
    year: '2019',
    rating: '7.59',
    description:
        'Covered in ice and snow, Elior Forest is the home to dangerous magical beasts and 50 elves frozen in ice. One day, the great spirit Puck helps a young girl break out of her ice prison. Her title is Emilia, a half-elf born with silver hair, long ears, and amethyst eyes-features that resemble the evil Witch who destroyed half the world long ago. Shunned by society because of her appearance, Emilia dwells in the forest with Puck as her sole companion and family. Burdened with a sin of destruction she does not remember committing, she spends her days trying to find a way to help her frozen kin. But when the great spirit Melakuera, the Arbitrator of the world, finds Emilia, her right to stay alive is brought into question. Will the bonds of ice she formed with Puck prove to be the warm thread that defies fate?',
    imageAsset:
        'https://m.media-amazon.com/images/M/MV5BMDc5MjM2YTAtNWFlOS00N2Y0LThkYWItYzI2OTAzYTA0MDZkXkEyXkFqcGc@._V1_FMjpg_UY3035_.jpg',
    imageUrls: [
      'https://cdn.myanimelist.net/images/characters/12/524543.jpg',
      'https://cdn.myanimelist.net/images/characters/15/300489.jpg',
      'https://cdn.myanimelist.net/images/characters/9/311327.jpg',
      'https://cdn.myanimelist.net/images/characters/15/315153.jpg',
      'https://cdn.myanimelist.net/images/characters/13/319348.jpg',
      'https://cdn.myanimelist.net/images/characters/15/306390.jpg',
      'https://cdn.myanimelist.net/images/characters/6/512960.jpg',
      'https://cdn.myanimelist.net/images/characters/8/405535.jpg',
      'https://cdn.myanimelist.net/images/characters/8/405536.jpg'
    ],
  ),
];
