import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/presentation/pages/news_skeleton.dart';
import 'package:kipnews/app/features/news/presentation/providers/bookmark_provicer.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';

class BookmarkPage extends ConsumerStatefulWidget {
  const BookmarkPage({super.key});

  @override
  ConsumerState<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends ConsumerState<BookmarkPage> {
  @override
  void initState() {
    super.initState();
    // Muat bookmark saat inisialisasi
    Future.microtask(() {
      ref.read(bookmarkProvider.notifier).loadBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookmarks = ref.watch(bookmarkProvider);

    return Padding(
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
                'Bookmarks',
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
              'Hi, Dzul! Your Saved Stories',
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
              hintText: 'Search Bookmarks',
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

          // Kondisi: Tidak ada bookmark
          if (bookmarks.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset('assets/images/bookmarks.png'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No Saved Articles Yet',
                      style: GoogleFonts.exo2(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Find articles to save',
                      style: GoogleFonts.exo2(
                        fontSize: 16,
                        color: AppColors.placeholder,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsSkeleton(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: AppColors.primary, width: 2),
                        ),
                      ),
                      child: Text(
                        'Read News',
                        style: GoogleFonts.exo2(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Kondisi: Ada bookmark
          if (bookmarks.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: bookmarks.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.primary, height: 1),
                itemBuilder: (context, index) {
                  final bookmark = bookmarks[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    leading: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Image.network(
                        bookmark.imageUrl ?? 'https://via.placeholder.com/80',
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
                      bookmark.title,
                      style: GoogleFonts.exo2(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          bookmark.authorId ?? "Unknown Author",
                          style: GoogleFonts.exo2(fontSize: 12),
                        ),
                        Row(
                          children: [
                            Text(
                              bookmark.publishedAt != null
                                  ? DateFormat(
                                      'dd MMM yyyy',
                                    ).format(bookmark.publishedAt!)
                                  : "Unknown Date",
                              style: GoogleFonts.exo2(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              bookmark.category,
                              style: GoogleFonts.exo2(
                                fontSize: 12,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        PhosphorIcons.bookmarkSimple(PhosphorIconsStyle.fill),
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        ref
                            .read(bookmarkProvider.notifier)
                            .toggleBookmark(bookmark);
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
