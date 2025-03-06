import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tiket_wisata/extensions/date_time_ext.dart';
import '../customtext/custom_button.dart';
import '../components/space.dart';
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
          'Payment Reciept',
          style: TextStyle(color: AppColors.backgroundColor),
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Assets.images.back.path, // Pakai .path untuk mendapatkan string path gambar
                color: AppColors.backgroundColor, // Warna gambar
              ),
            ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: context.deviceHeight / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12.0),
              ),
              color: AppColors.primaryColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.receiptCard.path),
              fit: BoxFit.cover,
                ),
              ),
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                children: [
                  const Text(
                    'PAYMENT RECIEPT',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                  const SpaceHeight(16.0),
                  QrImageView(
                    data: 'payment-receipt',
                    version: QrVersions.auto,
                  ),
                  const SpaceHeight(16.0),
                  const Text('Scan this QR code to verify tickets'),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tagihan'),
                      Text(120000.currencyFormatRp),
                    ],
                  ),
                  const SpaceHeight(40.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Metode Bayar'),
                      Text('QRIS'),
                    ],
                  ),
                  const SpaceHeight(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Waktu'),
                      Text(DateTime.now().toFormattedDate()),
                    ],
                  ),
                  const SpaceHeight(8.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status'),
                      Text('Lunas'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 20),
        child: Button.filled(
          onPressed: () {},
          label: 'Cetak Transaksi',
          borderRadius: 10.0,
        ),
      ),
    );
  }
}
