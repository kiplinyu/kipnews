// bookmark_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kipnews/app/features/news/business/entities/news_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

final bookmarkProvider =
    StateNotifierProvider<BookmarkNotifier, List<NewsEntity>>((ref) {
      return BookmarkNotifier();
    });

class BookmarkNotifier extends StateNotifier<List<NewsEntity>> {
  BookmarkNotifier() : super([]);

  // Key untuk SharedPreferences
  static const String _key = 'bookmarks';

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      // TODO: Implementasi deserialisasi dari JSON ke List<NewsEntity>
      // Untuk sementara kita gunakan state kosong
      state = [];
    }
  }

  Future<void> toggleBookmark(NewsEntity news) async {
    final prefs = await SharedPreferences.getInstance();
    List<NewsEntity> newBookmarks = [...state];

    if (isBookmarked(news)) {
      newBookmarks.removeWhere((item) => item.id == news.id);
    } else {
      newBookmarks.add(news);
    }

    // Simpan ke SharedPreferences
    // TODO: Implementasi serialisasi ke JSON
    // prefs.setString(_key, jsonEncode(newBookmarks));

    state = newBookmarks;
  }

  bool isBookmarked(NewsEntity news) {
    return state.any((item) => item.id == news.id);
  }
}
