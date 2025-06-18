import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:go_router/go_router.dart';
// import 'package:kipnews/app/config/routes/routes.dart';
import 'package:kipnews/app/core/constants/constants.dart';
// import 'package:kipnews/app/features/onboarding/presentation/widgets/button_widget.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Berita Bebas, Suara Kamu.",
                  style: GoogleFonts.exo2(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/onBoard-1.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Temukan berita terkini tanpa bias. Di KIPNews, kamu mendapatkan informasi yang jujur dan transparan.",
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
    );
  }
}
