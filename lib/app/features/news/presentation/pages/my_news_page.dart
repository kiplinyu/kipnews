import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/business/entities/news_entity.dart';
import 'package:kipnews/app/features/news/presentation/pages/create_news.dart';
import 'package:kipnews/app/features/news/presentation/providers/news_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MyNewsPage extends ConsumerStatefulWidget {
  const MyNewsPage({super.key});

  @override
  ConsumerState<MyNewsPage> createState() => _MyNewsPageState();
}

class _MyNewsPageState extends ConsumerState<MyNewsPage> {
  List<NewsEntity> myNews = []; // Daftar berita yang dibuat user

  // Data contoh untuk simulasi

  @override
  void initState() {
    super.initState();
    // Inisialisasi dengan data contoh
    Future.microtask(() async {
      final provider = ref.read(newsProvider);
      myNews = await provider.loadMyNews();
      setState(() {});
    });
  }

  void _addNews() async {
    // Navigasi ke halaman buat berita baru
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNews()),
    );

    // Jika ada data yang dikembalikan, tambahkan ke daftar
    if (result != null && result is bool) {
      final provider = ref.read(newsProvider);
      setState(() {
        Future.microtask(() async {
          myNews = await provider.loadMyNews();
        });
      });
    }
  }

  void _editNews(int index) async {
    // Navigasi ke halaman edit dengan membawa data berita
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNews(news: myNews[index])),
    );

    // Jika ada data yang dikembalikan, update berita
    if (result != null && result is bool) {
      final provider = ref.read(newsProvider);
      setState(() {
        Future.microtask(() async {
          myNews = await provider.loadMyNews();
        });
      });
    }
  }

  void _deleteNews(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete News', style: GoogleFonts.exo2()),
        content: Text(
          'Are you sure you want to delete this news?',
          style: GoogleFonts.exo2(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.exo2()),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                ref.read(newsProvider).delete(myNews[index].id);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('News deleted', style: GoogleFonts.exo2()),
                ),
              );
            },
            child: Text('Delete', style: GoogleFonts.exo2(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addNews,
        backgroundColor: AppColors.primary,
        child: Icon(PhosphorIcons.plus(), color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  child: Image.asset('assets/images/kipnewslogo-only.png'),
                ),
                const SizedBox(width: 12),
                Text(
                  'My News',
                  style: GoogleFonts.exo2(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 37.0),
              child: Text(
                'Hi, Dzul! Shape the Conversation',
                style: GoogleFonts.exo2(
                  color: AppColors.placeholder,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search My News',
                hintStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                prefixIcon: Icon(
                  PhosphorIcons.magnifyingGlass(),
                  color: AppColors.placeholder,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Kondisi: Tidak ada berita
            if (myNews.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Placeholder untuk gambar
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          PhosphorIcons.newspaper(),
                          size: 100,
                          color: AppColors.placeholder,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'You Haven\'t Written Anything Yet',
                        style: GoogleFonts.exo2(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Share your perspective',
                        style: GoogleFonts.exo2(
                          fontSize: 16,
                          color: AppColors.placeholder,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

            // Kondisi: Ada berita
            if (myNews.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: myNews.length,
                  itemBuilder: (context, index) {
                    final news = myNews[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  news.publishedAt.toString(),
                                  style: GoogleFonts.exo2(
                                    fontSize: 14,
                                    color: AppColors.placeholder,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(PhosphorIcons.pencil()),
                                      onPressed: () => _editNews(index),
                                      color: AppColors.primary,
                                    ),
                                    IconButton(
                                      icon: Icon(PhosphorIcons.trash()),
                                      onPressed: () => _deleteNews(index),
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              news.title,
                              style: GoogleFonts.exo2(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              news.summary,
                              style: GoogleFonts.exo2(
                                fontSize: 14,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    news.category,
                                    style: GoogleFonts.exo2(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
