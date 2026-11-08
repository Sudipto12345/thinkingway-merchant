import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/constants/colors.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  double? _dynamicAmount;

  String get _emvcoPayload {
    final amtTag = _dynamicAmount != null && _dynamicAmount! > 0
        ? "540${_dynamicAmount!.toStringAsFixed(0).length}${_dynamicAmount!.toStringAsFixed(0)}"
        : "";
    return "0002010102${_dynamicAmount != null ? '12' : '11'}26480015BD.BANGLAQR.PSO01060151900211TW-MER-8801520454115303050${amtTag}5802BD5911Rahim Store6008RAJSHAHI6304A9F4";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bangla QR (বাংলা কিউআর)"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Text("THINKINGWAY MERCHANT", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryNavy, letterSpacing: 1.1)),
                  const SizedBox(height: 4),
                  const Text("Rahim Store • ID: TW-MER-8801", style: TextStyle(fontSize: 13, color: AppColors.textMuted)),
                  const SizedBox(height: 20),
                  QrImageView(data: _emvcoPayload, version: QrVersions.auto, size: 220),
                  const SizedBox(height: 16),
                  if (_dynamicAmount != null)
                    Text("নির্ধারিত পরিমাণ: ৳ ${_dynamicAmount!.toStringAsFixed(0)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.secondaryGreen)),
                  const SizedBox(height: 8),
                  const Text("Approved through Bangla QR Network", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryNavy)),
                  const Text("All Bank Apps • bKash • Nagad • Rocket • Visa/Mastercard", style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [null, 100.0, 500.0, 1000.0, 1500.0].map((amt) {
                final selected = _dynamicAmount == amt;
                return ChoiceChip(
                  label: Text(amt == null ? "Static QR" : "৳ ${amt.toInt()}"),
                  selected: selected,
                  onSelected: (_) => setState(() => _dynamicAmount = amt),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
