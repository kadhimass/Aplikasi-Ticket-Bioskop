// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
// Sesuaikan dengan path file utilitas Anda
import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // --- Data Dummy Film ---
  final List<Map<String, String>> nowShowingMovies = const [
    {
      'title': 'PREDATOR: BADLANDS',
      'rating': '4.5',
      'genre': 'Action',
      'duration': '2h 15m',
      'poster': 'assets/Posters/inception.jpg',
      'date': '05 Nov 2025',
      'likes': '132'
    },
    {
      'title': 'THE FIRST RIDE',
      'rating': '4.7',
      'genre': 'Drama',
      'duration': '2h 12m',
      'poster': 'assets/Posters/Interstellar.jpg',
      'date': '07 Nov 2025',
      'likes': '189'
    },
    {
      'title': 'AMALA',
      'rating': '4.2',
      'genre': 'Action',
      'duration': '2h 12m',
      'poster': 'assets/Posters/marvel.jpg',
      'date': '10 Nov 2025',
      'likes': '98'
    },
  ];

  final List<Map<String, dynamic>> upcomingMovies = const [
    {
      'title': 'Vaathi',
      'reminder': true,
      'genre': 'Action · Thriller',
      'poster': 'assets/Posters/mulan.jpg'
    },
    {
      'title': 'Shehzada',
      'reminder': false,
      'genre': 'Action · Comedy',
      'poster': 'assets/Posters/StarWars.jpg'
    },
    {
      'title': 'New Film Title',
      'reminder': true,
      'genre': 'Drama',
      'poster': 'assets/Posters/thelastofus.jpg'
    },
    {
      'title': 'Another Film',
      'reminder': false,
      'genre': 'Sci-Fi',
      'poster': 'assets/Posters/thewindrises.jpg'
    },
  ];
  // -----------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan SafeArea agar konten tidak tertutup notch atau status bar
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1. App Bar Kustom (Lokasi, Notifikasi, Scanner)
              _buildCustomAppBar(context),
              const SizedBox(height: 20),

              // 2. Search Bar
              _buildSearchBar(context),
              const SizedBox(height: 16),

              // Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/Posters/StarWars.jpg',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 140,
                      color: kPrimaryDark,
                      child: const Center(
                        child: Text('Banner', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Explore / Now Showing Section
              _buildMovieSectionHeader(context, 'Explore Movies'),
              const SizedBox(height: 12),
              _buildNowShowingList(),
              const SizedBox(height: 20),

              // Upcoming Movies Section
              _buildMovieSectionHeader(context, 'Upcoming Movies'),
              const SizedBox(height: 12),
              _buildUpcomingMoviesList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // 5. Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // --- WIDGET PEMBANGUN UTAMA ---

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Kiri: Lokasi dan Slogan
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, color: kAccentColor, size: 20),
                  const SizedBox(width: 4),
                  // Dropdown Lokasi
                  const Text(
                    'Chennai',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.keyboard_arrow_down,
                      color: kTextColor, size: 20),
                ],
              ),
              const Text(
                'Welcome to Cinemasy',
                style: TextStyle(color: kTextSecondary, fontSize: 14),
              ),
            ],
          ),
          // Kanan: Ikon
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: kTextColor),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_scanner, color: kTextColor),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: kInputFillColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: kAccentColor),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search movies or theatres',
                hintStyle: TextStyle(color: kTextSecondary),
                border: InputBorder
                    .none, // Menghilangkan border karena sudah diatur di Container
                isDense: true, // Mengurangi padding internal TextField
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
              style: const TextStyle(color: kTextColor),
            ),
          ),
          const Icon(Icons.mic, color: kAccentColor),
        ],
      ),
    );
  }

  Widget _buildMovieSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: kTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child:
                const Text('View all', style: TextStyle(color: kAccentColor)),
          ),
        ],
      ),
    );
  }

  // --- NOW SHOWING (HORIZONTAL LIST) ---

  Widget _buildNowShowingList() {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: nowShowingMovies.length,
        itemBuilder: (context, index) {
          final movie = nowShowingMovies[index];
          return _buildMoviePosterCard(
            movie['title']!,
            movie['rating']!,
            movie['genre']!,
            movie['duration']!,
            movie['poster']!,
          );
        },
      ),
    );
  }

  // Fungsi ini sekarang menerima String untuk rating (karena sudah dikonversi di data dummy)
  Widget _buildMoviePosterCard(String title, String rating, String genre,
      String duration, String posterPath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Poster Film
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 200,
              width: double.infinity,
              color: kInputFillColor,
              child: Image.asset(
                posterPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Text('No Image',
                      style: const TextStyle(color: kTextSecondary)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style:
                const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 14),
              const SizedBox(width: 4),
              Text(rating, style: const TextStyle(color: kTextSecondary)),
              const Spacer(),
              Text('U · $duration',
                  style: const TextStyle(color: kTextSecondary)),
            ],
          ),
          Text(genre,
              style: const TextStyle(color: kTextSecondary, fontSize: 12)),
        ],
      ),
    );
  }

  // --- UPCOMING MOVIES (GRID LIST) ---

  Widget _buildUpcomingMoviesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.75,
        ),
        itemCount: upcomingMovies.length,
        itemBuilder: (context, index) {
          final movie = upcomingMovies[index];
          return _buildUpcomingMovieCard(
            movie['title']! as String,
            movie['reminder'] as bool,
            movie['genre']! as String,
            movie['poster']! as String,
          );
        },
      ),
    );
  }

  Widget _buildUpcomingMovieCard(
      String title, bool isReminderSet, String genre, String posterPath) {
    return Container(
      decoration: BoxDecoration(
        color: kInputFillColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Poster dan Reminder Tag
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  posterPath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: kPrimaryDark,
                    child: Center(
                        child: Text('No Image',
                            style: const TextStyle(color: kTextSecondary))),
                  ),
                ),
              ),
              // Tag Reminder Set
              if (isReminderSet)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.schedule, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text('Reminder set',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: kTextColor, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(genre,
                    style:
                        const TextStyle(color: kTextSecondary, fontSize: 12)),
                if (!isReminderSet)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.schedule, size: 18),
                      label: const Text('Remind me'),
                      style: TextButton.styleFrom(
                          foregroundColor: kAccentColor,
                          padding: EdgeInsets.zero),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- BOTTOM NAVIGATION BAR ---

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kInputFillColor, // Latar belakang navigasi
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: kAccentColor,
        unselectedItemColor: kTextSecondary,
        currentIndex: 0,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_rounded),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters_rounded),
            label: 'Theatres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
