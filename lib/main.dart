import 'dart:async';
import 'package:flutter/material.dart';
part 'screens/home_screen.dart';
part 'screens/monitoring_screen.dart';
part 'screens/accident_alert_screen.dart';
part 'screens/emergency_screen.dart';
part 'screens/history_screen.dart';
part 'screens/settings_screen.dart';
part 'widgets/reusable_widgets.dart';

void main() {
  runApp(const RiskDriveApp());
}

class RiskDriveApp extends StatefulWidget {
  const RiskDriveApp({super.key});

  @override
  State<RiskDriveApp> createState() => _RiskDriveAppState();
}

class _RiskDriveAppState extends State<RiskDriveApp> {
  bool isDark = true;
  bool isArabic = true;

  @override
  Widget build(BuildContext context) {
    final bg = isDark
        ? const Color(0xFF101827)
        : const Color(0xFFF5F7FA);
    final card = isDark
        ? const Color(0xFF1D2939)
        : Colors.white;
    final text = isDark
        ? const Color(0xFFF5F7FA)
        : const Color(0xFF101827);
    final muted = isDark
        ? const Color(0xFF98A2B3)
        : const Color(0xFF667085);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Risk Drive',
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: bg,
        primaryColor: const Color(0xFF16A36A),
        cardColor: card,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16A36A),
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: bg,
          foregroundColor: text,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: card,
          selectedItemColor: const Color(0xFF16A36A),
          unselectedItemColor: muted,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: MainScreen(
        isDark: isDark,
        isArabic: isArabic,
        onThemeChanged: (value) => setState(() => isDark = value),
        onLanguageChanged: (value) => setState(() => isArabic = value),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final bool isDark;
  final bool isArabic;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<bool> onLanguageChanged;

  const MainScreen({
    super.key,
    required this.isDark,
    required this.isArabic,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  bool isMonitoring = false;
  bool showAlert = false;
  int alertSeconds = 20;
  Timer? alertTimer;

  static const green = Color(0xFF16A36A);
  static const red = Color(0xFFF04438);
  static const orange = Color(0xFFF79009);

  String tr(String ar, String en) =>
      widget.isArabic ? ar : en;

  Color get bgColor => widget.isDark
      ? const Color(0xFF101827)
      : const Color(0xFFF5F7FA);

  Color get cardColor => widget.isDark
      ? const Color(0xFF1D2939)
      : Colors.white;

  Color get textColor => widget.isDark
      ? const Color(0xFFF5F7FA)
      : const Color(0xFF101827);

  Color get mutedColor => widget.isDark
      ? const Color(0xFF98A2B3)
      : const Color(0xFF667085);

  @override
  void dispose() {
    alertTimer?.cancel();
    super.dispose();
  }

  void startAccidentAlert() {
    alertTimer?.cancel();

    setState(() {
      showAlert = true;
      alertSeconds = 20;
    });

    alertTimer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        if (alertSeconds > 1) {
          setState(() => alertSeconds--);
        } else {
          timer.cancel();
          setState(() {
            alertSeconds = 0;
            showAlert = false;
            selectedIndex = 4;
          });
        }
      },
    );
  }

  void cancelAlert() {
    alertTimer?.cancel();
    setState(() {
      showAlert = false;
      alertSeconds = 20;
    });
  }

  void changeTab(int index) {
    alertTimer?.cancel();
    setState(() {
      selectedIndex = index;
      showAlert = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
      widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(
                Icons.directions_car,
                color: green,
                size: 27,
              ),
              const SizedBox(width: 9),
              Text(
                'Risk Drive',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Icon(
                Icons.shield_outlined,
                color: green,
                size: 25,
              ),
            ),
          ],
        ),
        body: showAlert
            ? accidentAlertScreen()
            : IndexedStack(
          index: selectedIndex,
          children: [
            homeScreen(),
            monitoringScreen(),
            historyScreen(),
            settingsScreen(),
            emergencyScreen(),
          ],
        ),
        bottomNavigationBar: showAlert
            ? null
            : BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: changeTab,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: tr('الرئيسية', 'Home'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.monitor_heart_outlined),
              label: tr('المراقبة', 'Monitoring'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history),
              label: tr('السجل', 'History'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              label: tr('الإعدادات', 'Settings'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.emergency_outlined),
              label: tr('الطوارئ', 'Emergency'),
            ),
          ],
        ),
      ),
    );
  }

  // HOME SCREEN

  

  // MONITORING SCREEN

  

  // ACCIDENT ALERT SCREEN

  

  // EMERGENCY SCREEN

  

  // HISTORY SCREEN

  

  // SETTINGS SCREEN

  

  // REUSABLE WIDGETS

  

  

  

  

  
}