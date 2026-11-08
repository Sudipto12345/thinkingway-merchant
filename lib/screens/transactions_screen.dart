import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("লেনদেন (Transactions)")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Tuition Fee • QR BANGLA"),
              subtitle: Text("ID: TW202611090001 • 10 Nov 2026, 11:45 AM"),
              trailing: Text("+৳ 1,000", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Retail Counter • QR BANGLA"),
              subtitle: Text("ID: TWQ123456789 • Verified"),
              trailing: Text("+৳ 1,500", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
            ),
          ),
        ],
      ),
    );
  }
}
