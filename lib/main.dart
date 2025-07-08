import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

import 'utilities/app_colors.dart';
import 'utilities/screen_size_config.dart';
import 'core/routes/auto_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryBG,
        appBarTheme: AppBarTheme(color: AppColors.primaryBG),
      ),
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
