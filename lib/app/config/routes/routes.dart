// routes.dart
class Routes {
  static const splash = '/splash'; // Pisahkan dari root
  static const home = '/'; // Gunakan root untuk home
  static const post = '/post';
  // Auth
  static const login = '/login';
  static const register = '/register';

  // Onboarding
  static const onBoarding = '/onboarding';
  static const onBoardingFirst = '$onBoarding/first';
  static const onBoardingSecond = '$onBoarding/second';

  // Gunakan nilai yang sama untuk path dan constant
  static const onBoardingFirstPath = 'first';
  static const onBoardingSecondPath = 'second';
}
