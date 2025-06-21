import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/business/entities/news_entity.dart';
import 'package:kipnews/app/features/news/presentation/pages/detail_page.dart';
import 'package:kipnews/app/features/news/presentation/pages/profile_page.dart';
import 'package:kipnews/app/features/news/presentation/providers/news_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/routes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Safe call to load news after widget is initialized

    Future.microtask(() async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token == null) {
        context.go(Routes.login);
        return;
      }
      await ref.read(newsProvider).loadNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final NewsProvider provider = ref.watch(newsProvider);
    final List<NewsEntity> newsItems = provider.news;
    final carouselItems = newsItems.take(5).toList();
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
              carouselItems.isNotEmpty
                  ? CarouselSlider(
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
                                builder: (context) =>
                                    DetailPage(newsItem: item),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item.featuredImageUrl ??
                                        item.imageUrl ??
                                        'https://via.placeholder.com/400x200?text=No+Image',
                                  ),
                                  fit: BoxFit.cover,
                                ),
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
                                    item.category,
                                    style: GoogleFonts.exo2(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.title, // Tampilkan judul berita
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
                                        item.authorId ?? "Unknown Author",
                                        style: GoogleFonts.exo2(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        item.publishedAt
                                                ?.toLocal()
                                                .toString()
                                                .split('T')[0] ??
                                            "Unknown Date",
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
                    )
                  : const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
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
                        child: Image.network(
                          news.imageUrl ?? 'https://via.placeholder.com/80',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              PhosphorIcons.image(),
                              size: 40,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                      title: Text(
                        news.title,
                        style: GoogleFonts.exo2(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            news.authorId ?? "Unknown Author",
                            style: GoogleFonts.exo2(fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                news.publishedAt?.toLocal().toString().split(
                                      'T',
                                    )[0] ??
                                    "Unknown Date",
                                style: GoogleFonts.exo2(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                news.category,
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
