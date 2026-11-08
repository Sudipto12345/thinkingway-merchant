import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'core/services/voice_alert_service.dart';
import 'core/theme/app_theme.dart';
import 'screens/dashboard_screen.dart';
import 'screens/qr_code_screen.dart';
import 'screens/transactions_screen.dart';
import 'screens/settlement_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VoiceAlertService().init();
  runApp(const ThinkingWayMerchantApp());
}

class ThinkingWayMerchantApp extends StatelessWidget {
  const ThinkingWayMerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THINKINGWAY Merchant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationShell(),
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

  final List<Widget> _screens = const [
    DashboardScreen(),
    TransactionsScreen(),
    QrCodeScreen(),
    SettlementScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lightGreen,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront, color: AppColors.secondaryGreen),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long, color: AppColors.secondaryGreen),
            label: 'Transactions',
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner, color: AppColors.primaryNavy),
            selectedIcon: Icon(Icons.qr_code_2, color: AppColors.secondaryGreen),
            label: 'Bangla QR',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_outlined),
            selectedIcon: Icon(Icons.account_balance, color: AppColors.secondaryGreen),
            label: 'Settlement',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: AppColors.secondaryGreen),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
