import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class SettlementScreen extends StatelessWidget {
  const SettlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settlement & Reconciliation")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Settlement Bank Account", style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                SizedBox(height: 4),
                Text("City Bank PLC — Rajshahi Branch", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("A/C: 140293****8821 • Routing: NPSB / BEFTN", style: TextStyle(fontSize: 13, color: AppColors.secondaryGreen)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              title: Text("NPSB-EBL-20261108-01"),
              subtitle: Text("64 Transactions • Gross: ৳ 84,500 • MDR: ৳ 728.81"),
              trailing: Text("৳ 83,771.19", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
            ),
          ),
        ],
      ),
    );
  }
}
