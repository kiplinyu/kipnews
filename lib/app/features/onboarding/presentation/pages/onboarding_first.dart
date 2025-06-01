import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/onboarding/presentation/widgets/button_widget.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

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
              spacing: 40,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    "Berita Bebas, Suara Kamu.",
                    style: TextStyle(
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
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    spacing: 24,
                    children: [
                      ButtonWidget(text: 'Login', onPressed: () {}),
                      ButtonWidget(
                        text: 'Get Started',
                        isOutlined: true,
                        onPressed: () => context.push('/onboarding/second'),
                      ),
                    ],
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
