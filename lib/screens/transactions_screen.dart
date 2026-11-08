import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions History")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Mahmudul Hasan • Bangla QR"),
              subtitle: Text("Ref: BQR-NPSB-8849201 • Verified"),
              trailing: Text("+৳ 1,500", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Nusrat Jahan • SSLCOMMERZ"),
              subtitle: Text("Ref: SSLC-VAL-7748102 • Verified"),
              trailing: Text("+৳ 3,250", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
            ),
          ),
        ],
      ),
    );
  }
}
