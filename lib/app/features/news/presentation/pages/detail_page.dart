import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/business/entities/news_entity.dart';
import 'package:intl/intl.dart';
import 'package:kipnews/app/features/news/presentation/providers/bookmark_provicer.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DetailPage extends ConsumerWidget {
  final NewsEntity newsItem;

  const DetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkProvider);
    final isBookmarked = bookmarks.any((item) => item.id == newsItem.id);

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            newsItem.featuredImageUrl ??
                newsItem.imageUrl ??
                'https://via.placeholder.com/400x200?text=No+Image',
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              );
            },
          ),

          // Tombol back di atas gambar
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),

          // JUDUL DAN TANGGAL DI ATAS GAMBAR
          Positioned(
            left: 24,
            right: 24,
            bottom:
                MediaQuery.of(context).size.height * 0.8 -
                60, // Posisi di atas gambar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul berita
                Text(
                  newsItem.title,
                  style: GoogleFonts.exo2(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                    shadows: [
                      Shadow(blurRadius: 6, offset: const Offset(0, 2)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Tanggal berita
                Text(
                  DateFormat('dd MMM yyyy').format(newsItem.publishedAt!),
                  style: GoogleFonts.exo2(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(blurRadius: 4, offset: const Offset(0, 1)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Card konten yang menimpa gambar
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: Border.all(color: AppColors.primary, width: 2),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Garis horizontal kecil di atas card
                      Center(
                        child: Container(
                          width: 60,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),

                      // Author dan kategori
                      Row(
                        children: [
                          // CircleAvatar
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1657815555962-297100ce4b0e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Nama author dan kategori
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsItem.authorId ?? "Unknown Author",
                                  style: GoogleFonts.exo2(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  newsItem.category,
                                  style: GoogleFonts.exo2(
                                    fontSize: 16,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Bookmark icon
                          IconButton(
                            icon: Icon(
                              isBookmarked
                                  ? PhosphorIcons.bookmarkSimple(
                                      PhosphorIconsStyle.fill,
                                    )
                                  : PhosphorIcons.bookmarkSimple(
                                      PhosphorIconsStyle.regular,
                                    ),
                              size: 28,
                              color: isBookmarked
                                  ? AppColors.primary
                                  : Colors.black,
                            ),
                            onPressed: () {
                              ref
                                  .read(bookmarkProvider.notifier)
                                  .toggleBookmark(newsItem);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Divider orange
                      Divider(color: AppColors.primary, thickness: 1),
                      const SizedBox(height: 24),

                      // Isi berita
                      Text(
                        newsItem.content,
                        style: GoogleFonts.exo2(fontSize: 18, height: 1.6),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
