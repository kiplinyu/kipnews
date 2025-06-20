import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kipnews/app/config/routes/routes.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2), () async{
      if (!mounted) return;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token != null) {
        context.go(Routes.home);
      } else {
        context.go(Routes.onBoarding);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/kipnewslogo.png'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text("From"),

                SizedBox(
                  width: 90,
                  // height: 300,
                  child: Image.asset('assets/images/linyulogo.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
