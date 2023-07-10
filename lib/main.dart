import 'package:flutter/material.dart';
import 'package:portfolio/configs/theme/core_theme.dart';
import 'package:portfolio/features/main/main_screen.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:portfolio/provider/drawer_provider.dart';
import 'package:portfolio/provider/scroll_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider())
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, _) => MaterialChild(
          provider: value,
        ),
      ),
    );
  }
}

class MaterialChild extends StatefulWidget {
  const MaterialChild({super.key, required this.provider});
  final AppProvider provider;

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  void initAppTheme() {
    final appProviders = AppProvider.state(context);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lal's portfolio.",
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: widget.provider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
    );
  }
}
