import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class SettlementScreen extends StatelessWidget {
  const SettlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("রিপোর্ট ও সেটেলমেন্ট (Reports)")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("NPSB-EBL-20261108-01"),
              subtitle: Text("City Bank PLC • 142 Transactions"),
              trailing: Text("৳ 83,771.19", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
            ),
          ),
        ],
      ),
    );
  }
}
