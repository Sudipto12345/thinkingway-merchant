import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/constants/colors.dart';
import '../core/services/voice_alert_service.dart';
import '../models/transaction_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<TransactionModel> _recentTxns = [
    TransactionModel(
      id: "TXN-10296",
      providerRef: "BQR-NPSB-8849201",
      title: "Mahmudul Hasan",
      channel: "Bangla QR",
      amount: 1500.00,
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      status: PaymentStatus.success,
    ),
    TransactionModel(
      id: "TXN-10295",
      providerRef: "SSLC-VAL-7748102",
      title: "Nusrat Jahan",
      channel: "SSLCOMMERZ",
      amount: 3250.00,
      timestamp: DateTime.now().subtract(const Duration(minutes: 28)),
      status: PaymentStatus.success,
    ),
    TransactionModel(
      id: "TXN-10294",
      providerRef: "BQR-BKASH-552910",
      title: "Kamrul Islam",
      channel: "bKash (Bangla QR)",
      amount: 850.00,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      status: PaymentStatus.success,
    ),
    TransactionModel(
      id: "TXN-10293",
      providerRef: "NGD-PEND-991023",
      title: "Rashed Khan",
      channel: "Nagad",
      amount: 2000.00,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      status: PaymentStatus.pending,
      verifiedByPartner: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildKpiRow(),
            const SizedBox(height: 16),
            _buildRecentTransactions(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.secondaryGreen,
        onPressed: () {
          VoiceAlertService().speakPaymentReceived(1500);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("🔊 ১৫০০ টাকা পেমেন্ট সফল হয়েছে (Bangla QR Verified)"),
              backgroundColor: AppColors.primaryNavy,
            ),
          );
        },
        icon: const Icon(Icons.volume_up, color: Colors.white),
        label: const Text("টেস্ট সাউন্ডবক্স অ্যালার্ট", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 52, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.primaryNavy,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("THINKINGWAY MERCHANT", style: TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 1.1)),
                  SizedBox(height: 2),
                  Text("Rahim Store — Rajshahi", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("KYC Verified", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F9B4F), AppColors.secondaryGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today's Verified Collection (আজকের কালেকশন)", style: TextStyle(color: Colors.white70, fontSize: 13)),
                SizedBox(height: 6),
                Text("৳ 25,450.00", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
                SizedBox(height: 6),
                Text("19 Verified Transactions • T+1 NPSB Auto-Settlement", style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKpiRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Settlement Pending", style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                  SizedBox(height: 4),
                  Text("৳ 25,230.49", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.primaryNavy)),
                  SizedBox(height: 2),
                  Text("City Bank • Tomorrow 10 AM", style: TextStyle(fontSize: 11, color: AppColors.secondaryGreen)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Monthly Collection", style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                  SizedBox(height: 4),
                  Text("৳ 4,82,900", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.primaryNavy)),
                  SizedBox(height: 2),
                  Text("3 Branches Active", style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recent Transactions (সাম্প্রতিক লেনদেন)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          ListView.separated(
            itemCount: _recentTxns.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final txn = _recentTxns[index];
              final isSuccess = txn.status == PaymentStatus.success;
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                leading: CircleAvatar(
                  backgroundColor: isSuccess ? AppColors.lightGreen : const Color(0xFFFEF3C7),
                  child: Icon(
                    isSuccess ? Icons.check_circle_outline : Icons.schedule,
                    color: isSuccess ? AppColors.secondaryGreen : AppColors.warningAmber,
                  ),
                ),
                title: Text(txn.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                subtitle: Text("${txn.channel} • ${DateFormat('hh:mm a').format(txn.timestamp)}", style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
                trailing: Text(
                  "${isSuccess ? '+' : ''}৳ ${txn.amount.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isSuccess ? AppColors.secondaryGreen : AppColors.warningAmber,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
