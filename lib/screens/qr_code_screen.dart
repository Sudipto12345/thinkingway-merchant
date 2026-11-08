import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/constants/colors.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  bool _isEducation = false;

  final String _payload =
      "00020101021126480015BD.BANGLAQR.PSO01060151900211TW-MER-88015204541153030505802BD5911Rahim Store6008RAJSHAHI6304A9F4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEducation ? "QR BANGLA Education" : "QR BANGLA Standee"),
        actions: [
          Switch(
            value: _isEducation,
            activeColor: AppColors.secondaryGreen,
            onChanged: (v) => setState(() => _isEducation = v),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              const Text(
                "QR BANGLA",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.primaryNavy),
              ),
              Text(
                _isEducation ? "Education · Powered by THINKINGWAY" : "POWERED BY THINKINGWAY W",
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.secondaryGreen),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _isEducation ? AppColors.primaryNavy : AppColors.secondaryGreen,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  "এখানে QR দিয়ে পেমেন্ট করুন",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryGreen, width: 4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: QrImageView(data: _payload, version: QrVersions.auto, size: 210),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.secondaryGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "স্ক্যান করুন, পেমেন্ট করুন – সহজেই!",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "bKash • Nagad • Rocket • upay • tap • MyGP • SSLCOMMERZ • aamarPay • shurjoPay",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textMuted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
