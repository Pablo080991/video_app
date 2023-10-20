import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:video_app/config/theme/app_theme.dart';
import 'package:video_app/presentation/videoView/video_screen.dart';
import 'package:video_app/provider/video_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideoProvider())
      ],
      child: MaterialApp(
        title: 'Youtube Videos',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const VideoScreen()
      ),
    );
  }
}
