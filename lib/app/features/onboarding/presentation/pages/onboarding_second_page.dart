import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:go_router/go_router.dart';
import 'package:kipnews/app/core/constants/constants.dart';
// import 'package:kipnews/app/features/onboarding/presentation/widgets/button_widget.dart';

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Personalisasi Berita Sesuai Minatmu.",
                    style: GoogleFonts.exo2(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  width: 360,
                  height: 360,
                  child: Image.asset('assets/images/onBoard-2.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    "Pilih topik favoritmu dan dapatkan update real-time yang relevan dengan minat kamu.",
                    style: GoogleFonts.exo2(
                      color: AppColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
