import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("প্রোফাইল ও সেটিংস (Profile)")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primaryNavy,
                child: Icon(Icons.verified_user, color: AppColors.secondaryGreen),
              ),
              title: Text("Rahim Store (TW-MER-8801)"),
              subtitle: Text("QR BANGLA Merchant • Powered by THINKINGWAY W"),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondaryGreen,
                child: Icon(Icons.badge, color: Colors.white),
              ),
              title: Text("Md. Sudipto Halder"),
              subtitle: Text("Field Executive • Agent & DSO Network"),
            ),
          ),
        ],
      ),
    );
  }
}
