import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/services/voice_alert_service.dart';
import 'payment_success_screen.dart';

class DashboardScreen extends StatefulWidget {
  final ValueChanged<int> onNavigateTab;
  const DashboardScreen({super.key, required this.onNavigateTab});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isBengali = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "QR Bangla",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () => setState(() => _isBengali = !_isBengali),
            child: Text(
              _isBengali ? "EN" : "বাংলা",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              VoiceAlertService().speakPaymentReceived(1000);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Green Collection Card: আজকের সংগ্রহ ৳ 25,850
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F9B4F), AppColors.secondaryGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isBengali ? "আজকের সংগ্রহ" : "Total Sales Today",
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "৳ 25,850",
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const Icon(Icons.trending_up_rounded, color: Colors.white, size: 48),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // White Card: মোট লেনদেন 142
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isBengali ? "মোট লেনদেন" : "Total Transactions",
                        style: const TextStyle(color: AppColors.textMuted, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "142",
                        style: TextStyle(color: AppColors.primaryNavy, fontSize: 26, fontWeight: FontWeight.w900),
                      ),
                      const Text(
                        "↑ 12%",
                        style: TextStyle(color: AppColors.secondaryGreen, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Icon(Icons.bar_chart_rounded, color: AppColors.secondaryGreen, size: 48),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 2x2 Action Grid: QR দেখুন, লেনদেন, রিপোর্ট, সেটিংস
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                _actionTile(
                  icon: Icons.qr_code_2_rounded,
                  label: _isBengali ? "QR দেখুন" : "My QR",
                  color: AppColors.primaryNavy,
                  onTap: () => widget.onNavigateTab(2),
                ),
                _actionTile(
                  icon: Icons.receipt_long_rounded,
                  label: _isBengali ? "লেনদেন" : "Transactions",
                  color: AppColors.deepBlue,
                  onTap: () => widget.onNavigateTab(1),
                ),
                _actionTile(
                  icon: Icons.insert_chart_outlined_rounded,
                  label: _isBengali ? "রিপোর্ট" : "Reports",
                  color: AppColors.primaryNavy,
                  onTap: () => widget.onNavigateTab(3),
                ),
                _actionTile(
                  icon: Icons.settings_outlined,
                  label: _isBengali ? "সেটিংস" : "Support",
                  color: AppColors.deepBlue,
                  onTap: () => widget.onNavigateTab(4),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Demo Button to open "পেমেন্ট সফল!" (Payment Successful) Screen + Soundbox
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  VoiceAlertService().speakPaymentReceived(1000);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PaymentSuccessScreen(
                        amount: 1000,
                        transactionId: "TW202611090001",
                        purpose: "Tuition Fee",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.volume_up_rounded),
                label: const Text(
                  "পেমেন্ট সফল রিসিট ও বাংলা সাউন্ডবক্স টেস্ট করুন (৳ 1,000)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _actionTile({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: Colors.white, size: 26),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.primaryNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
