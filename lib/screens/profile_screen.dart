import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Business Profile & Branches")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.verified_user, color: AppColors.secondaryGreen),
              title: Text("Rahim Store (TW-MER-8801)"),
              subtitle: Text("Trade License: RCC-TL-2025-8841 • Partner KYC Verified"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.store, color: AppColors.primaryNavy),
              title: Text("3 Active Branches in Rajshahi"),
              subtitle: Text("Shaheb Bazar • Boalia New Market • Kazla Gate (RU)"),
            ),
          ),
        ],
      ),
    );
  }
}
