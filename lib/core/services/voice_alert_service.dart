import 'package:flutter_tts/flutter_tts.dart';

class VoiceAlertService {
  static final VoiceAlertService _instance = VoiceAlertService._internal();
  factory VoiceAlertService() => _instance;
  VoiceAlertService._internal();

  final FlutterTts _tts = FlutterTts();

  Future<void> init() async {
    try {
      await _tts.setLanguage("bn-BD");
      await _tts.setPitch(1.0);
      await _tts.setSpeechRate(0.88);
    } catch (_) {}
  }

  Future<void> speakPaymentReceived(double amount, {String channel = "QR Bangla"}) async {
    final text = "${amount.toInt()} টাকা পেমেন্ট সফল হয়েছে। ধন্যবাদ।";
    await _tts.speak(text);
  }
}
