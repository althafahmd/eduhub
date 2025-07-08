import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../core/routes/auto_route.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _next(context);
  }

  Future<void> _next(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    context.router.replace(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          child: Icon(
            Icons.menu_book_rounded,
            size: 50.0,
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}
