import 'package:app_template/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void bootStrap(ThemeMode themeMode) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(themeMode: themeMode),
  );
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.light:
        debugPrint('💡 ThemeMode.light');
        break;
      case ThemeMode.dark:
        debugPrint('🌛 ThemeMode.dark');
        break;
      case ThemeMode.system:
        debugPrint('📲 ThemeMode.system');
        break;
    }
    return MaterialApp(
      title: 'Flutter Demo ${themeMode.name}',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      localizationsDelegates: const [],
      home: InitialScreen(title: 'Flutter Demo ${themeMode.name} mode'),
    );
  }
}
