import 'package:flutter/material.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/presentation/pages/bookmark_page.dart';
import 'package:kipnews/app/features/news/presentation/pages/home_page.dart';
import 'package:kipnews/app/features/news/presentation/pages/my_news_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NewsSkeleton extends StatefulWidget {
  const NewsSkeleton({super.key});

  @override
  State<NewsSkeleton> createState() => _NewsSkeletonState();
}

class _NewsSkeletonState extends State<NewsSkeleton> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _pages = [
    const HomePage(), // Gunakan HomePage yang sudah ada
    const BookmarkPage(),
    const MyNewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          color: AppColors.primary,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppColors.background,
            unselectedItemColor: Colors.grey[300],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  PhosphorIcons.house(
                    _currentIndex == 0
                        ? PhosphorIconsStyle.fill
                        : PhosphorIconsStyle.regular,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  PhosphorIcons.bookmarkSimple(
                    _currentIndex == 1
                        ? PhosphorIconsStyle.fill
                        : PhosphorIconsStyle.regular,
                  ),
                ),
                label: 'Bookmarks',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  PhosphorIcons.newspaper(
                    _currentIndex == 2
                        ? PhosphorIconsStyle.fill
                        : PhosphorIconsStyle.regular,
                  ),
                ),
                label: 'My News',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
