import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/providers/favoriteProviders.dart';
import 'package:provider/provider.dart';
import 'package:ujianprojectflutter/frontend/views/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode darkmode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromARGB(255, 30, 215, 96),
            ),
          ).copyWith(
            scaffoldBackgroundColor: Color.fromARGB(255, 202, 224, 236),
            cardColor: Color.fromARGB(255, 253, 250, 243),
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
                bodyText1: TextStyle(color: Color.fromARGB(255, 1, 67, 121)),
                bodyText2: TextStyle(color: Colors.black)),
          ),
          darkTheme: ThemeData.dark(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
