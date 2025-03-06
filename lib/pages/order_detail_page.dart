import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import
import '../gen/assets.gen.dart';
import '../dialogs/payment_qris_dialog.dart';
import '../dialogs/payment_tunai_dialog.dart';
import '../models/product_models.dart';
import '../constants/colors.dart';
import '../extensions/ext.dart';
import '../extensions/build_context_ext.dart';

class OrderDetailPage extends StatelessWidget {
  final List<Product> products;
  const OrderDetailPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    int paymentButtonIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.images.back.image(),
              // If SVG has issues, you can try using a regular icon as fallback
              // or use Icon(Icons.arrow_back) as fallback
            
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20.0),
        itemBuilder: (context, index) {
          final product = products[index];
          // Simple card instead of OrderDetailCard
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${product.type} - ${product.price.currencyFormatRp}'),
                      Text('Qty: ${product.quantity}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total: ${(product.price * product.quantity).currencyFormatRp}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatefulBuilder(
              builder: (context, setState) => Row(
                children: [
                  Expanded(
                    child: _buildSimplePaymentButton(
                      context: context,
                      iconPath: 'assets/icons/payment/qris.svg',
                      label: 'QRIS',
                      isActive: paymentButtonIndex == 0,
                      onPressed: () => setState(() => paymentButtonIndex = 0),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: _buildSimplePaymentButton(
                      context: context,
                      iconPath: 'assets/icons/payment/tunai.svg',
                      label: 'Tunai',
                      isActive: paymentButtonIndex == 1,
                      onPressed: () => setState(() => paymentButtonIndex = 1),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: _buildSimplePaymentButton(
                      context: context,
                      iconPath: 'assets/icons/payment/transfer.svg',
                      label: 'Transfer',
                      isActive: paymentButtonIndex == 2,
                      onPressed: () => setState(() => paymentButtonIndex = 2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    spreadRadius: 0,
                    offset: const Offset(0, -2),
                    color: AppColors.textColor.withOpacity(8 / 100),
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Order Summary'),
                        Text(
                          _calculateTotalPrice().currencyFormatRp,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        if (paymentButtonIndex == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => const PaymentQrisDialog(),
                          );
                        } else if (paymentButtonIndex == 1) {
                          showDialog(
                            context: context,
                            builder: (context) => PaymentTunaiDialog(
                              totalPrice: _calculateTotalPrice().toInt(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Process',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modified method to use SVG for payment buttons
  Widget _buildSimplePaymentButton({
    required BuildContext context,
    required String iconPath,
    required String label,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? AppColors.primaryColor : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.primaryColor : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to calculate total price
  double _calculateTotalPrice() {
    double total = 0;
    for (var product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }
}