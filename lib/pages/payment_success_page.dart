import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tiket_wisata/extensions/date_time_ext.dart';
import '../customtext/custom_button.dart';
import '../constants/colors.dart';
import '../extensions/build_context_ext.dart';
import '../extensions/ext.dart';
import '../gen/assets.gen.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Payment Receipt',
          style: TextStyle(color: AppColors.backgroundColor),
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.images.back.path,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Blue background
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
            ),
            
            // White card content
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.9, // 90% screen width
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'PAYMENT RECEIPT',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          
                          // QR Code
                          Center(
                            child: SizedBox(
                              width: 180,
                              height: 180,
                              child: QrImageView(
                                data: 'payment-receipt',
                                version: QrVersions.auto,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          
                          const Text(
                            'Scan this QR code to verify tickets',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          
                          // Payment details - exactly as shown in screenshot
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Tagihan',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(120000.currencyFormatRp),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Metode Bayar',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'QRIS',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Waktu',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      DateTime.now().toFormattedDate(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Status',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Lunas',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Button.filled(
            onPressed: () {},
            label: 'Cetak Transaksi',
            borderRadius: 10.0,
          ),
        ),
      ),
    );
  }
}