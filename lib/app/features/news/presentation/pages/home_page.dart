import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/presentation/pages/profile_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> carouselItems = [
    {
      'title': 'DualSense VR Pro: Sensasi Game Immersive Tappa Batas!',
      'author': 'Kurokawa Akane',
      'date': '13 Mar 2025',
      'category': 'Gaming',
      'color': AppColors.primary,
    },
    {
      'title': 'Film Indie "Malam di Puncak" Tayang Perdana',
      'author': 'Emilia',
      'date': '15 Apr 2025',
      'category': 'Entertainment',
      'color': Colors.blueAccent,
    },
    {
      'title': 'DualSense VR Pro: Sensasi Game Immersive Tappa Batas!',
      'author': 'Kurokawa Akane',
      'date': '13 Mar 2025',
      'category': 'Gaming',
      'color': AppColors.primary,
    },
    {
      'title': 'Film Indie "Malam di Puncak" Tayang Perdana',
      'author': 'Emilia',
      'date': '15 Apr 2025',
      'category': 'Entertainment',
      'color': Colors.blueAccent,
    },
    {
      'title': 'DualSense VR Pro: Sensasi Game Immersive Tappa Batas!',
      'author': 'Kurokawa Akane',
      'date': '13 Mar 2025',
      'category': 'Gaming',
      'color': AppColors.primary,
    },
    {
      'title': 'Film Indie "Malam di Puncak" Tayang Perdana',
      'author': 'Emilia',
      'date': '15 Apr 2025',
      'category': 'Entertainment',
      'color': Colors.blueAccent,
    },
    // Tambahkan lebih banyak item jika diperlukan
  ];

  final List<Map<String, dynamic>> newsItems = [
    {
      'title':
          'Startup Lokal Rilis Chatbot Kripto Pintar yang Bisa Baca Sentimen Twitter',
      'author': 'Alisa Mikhailovna Kujou',
      'date': '24 Jan 2025',
      'category': 'Tech',
    },
    {
      'title': 'Emas Melejit 7% Sepanjang April, Analis Prediksi Masih Naik',
      'author': 'Shouko Komi',
      'date': '1 Apr 2025',
      'category': 'Finance',
    },
    {
      'title': 'Film Indie ‘Malam di Puncak’',
      'author': 'Emilia',
      'date': '1 Apr 2025',
      'category': 'Entertainment',
    },
    {
      'title':
          'Startup Lokal Rilis Chatbot Kripto Pintar yang Bisa Baca Sentimen Twitter',
      'author': 'Alisa Mikhailovna Kujou',
      'date': '24 Jan 2025',
      'category': 'Tech',
    },
    {
      'title': 'Emas Melejit 7% Sepanjang April, Analis Prediksi Masih Naik',
      'author': 'Shouko Komi',
      'date': '1 Apr 2025',
      'category': 'Finance',
    },
    {
      'title': 'Film Indie ‘Malam di Puncak’',
      'author': 'Emilia',
      'date': '1 Apr 2025',
      'category': 'Entertainment',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan profil
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Dzul!',
                          style: GoogleFonts.exo2(
                            color: AppColors.placeholder,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Explore Today’s World News',
                          style: GoogleFonts.exo2(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  // Ganti bagian CircleAvatar dengan ini:
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1657815555962-297100ce4b0e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search News',
                  hintStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                  prefixIcon: Icon(
                    PhosphorIcons.magnifyingGlass(),
                    color: AppColors.placeholder,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ), // Warna default
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ), // Warna saat fokus
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.85,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  enableInfiniteScroll: true,
                  padEnds: false,
                ),
                items: carouselItems.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(newsItem: item),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: item['color'],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: AppColors.placeholder,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              item['category'],
                              style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['title'],
                              style: GoogleFonts.exo2(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  item['author'],
                                  style: GoogleFonts.exo2(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  item['date'],
                                  style: GoogleFonts.exo2(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // Latest News Section
              SizedBox(height: 8),
              Divider(color: AppColors.primary, height: 1),
              SizedBox(height: 4),

              // News List
              Expanded(
                child: ListView.separated(
                  itemCount: newsItems.length,
                  separatorBuilder: (context, index) =>
                      const Divider(color: AppColors.primary, height: 1),
                  itemBuilder: (context, index) {
                    final news = newsItems[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                      leading: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        // Placeholder untuk gambar berita
                        child: Icon(PhosphorIcons.image(), color: Colors.grey),
                      ),
                      title: Text(
                        news['title'],
                        style: GoogleFonts.exo2(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            news['author'],
                            style: GoogleFonts.exo2(fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                news['date'],
                                style: GoogleFonts.exo2(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                news['category'],
                                style: GoogleFonts.exo2(
                                  fontSize: 12,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(newsItem: news),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman detail (placeholder)
class DetailPage extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  const DetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsItem['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(newsItem['author']),
      ),
    );
  }
}
