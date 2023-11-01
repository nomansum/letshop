import 'package:flutter/material.dart';
import 'package:letshop/constants/global_variables.dart';
import 'package:letshop/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'LetShoP',
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
          scaffoldBackgroundColor: GlobalVariables.backgroundColor),
      routerConfig: AppRouter().router,
    );
  }
}
