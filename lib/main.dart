import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/SplashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaleFactor: 1,
          ),
          child: child!,
        );
      },
      title: 'Flutter Customer',
      theme: ThemeData(
          primarySwatch: const MaterialColor(
            0xFF0F2146,
            <int, Color>{
              50: Color(0xFF0F2146),
              100: Color(0xFF0F2146),
              200: Color(0xFF0F2146),
              300: Color(0xFF0F2146),
              400: Color(0xFF0F2146),
              500: Color(0xFF0F2146),
              600: Color(0xFF0F2146),
              700: Color(0xFF0F2146),
              800: Color(0xFF0F2146),
              900: Color(0xFF0F2146),
            },
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })),
      home: const Splash(),
    );
  }
}
