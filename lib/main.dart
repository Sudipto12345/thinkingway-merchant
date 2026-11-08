import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'core/services/voice_alert_service.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/qr_code_screen.dart';
import 'screens/payment_success_screen.dart';
import 'screens/transactions_screen.dart';
import 'screens/settlement_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VoiceAlertService().init();
  runApp(const QrBanglaMerchantApp());
}

class QrBanglaMerchantApp extends StatelessWidget {
  const QrBanglaMerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR BANGLA - THINKINGWAY',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  void _navigateToTab(int idx) {
    setState(() => _currentIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(onNavigateTab: _navigateToTab),
      const TransactionsScreen(),
      const QrCodeScreen(),
      const SettlementScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryGreen,
        elevation: 4,
        shape: const CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
        onPressed: () => _navigateToTab(2),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        height: 66,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(0, Icons.home_rounded, 'হোম'),
            _navItem(1, Icons.receipt_long_rounded, 'লেনদেন'),
            const SizedBox(width: 44), // Space for center QR button
            _navItem(3, Icons.bar_chart_rounded, 'রিপোর্ট'),
            _navItem(4, Icons.person_outline_rounded, 'প্রোফাইল'),
          ],
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    final bool selected = _currentIndex == index;
    return InkWell(
      onTap: () => _navigateToTab(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: selected ? AppColors.secondaryGreen : AppColors.textMuted,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                color: selected ? AppColors.secondaryGreen : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
