import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/themes/dark_theme.dart';
import 'models/themes/light_theme.dart';
import '../providers/theme_provider.dart';
import 'screens/main_menu.dart';

void main() {
  runApp(
    ChangeNotifierProvider<DynamicTheme>(
      create: (_) => DynamicTheme(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedly Clone',
      theme: themeProvider.getDarkMode() ? darkTheme : lightTheme,
      home: MainMenu(
        'Today',
      ),
    );
  }
}
