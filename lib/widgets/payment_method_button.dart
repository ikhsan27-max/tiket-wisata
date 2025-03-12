import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tiket_wisata/semua_inputan.dart';

class PaymentMethodButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const PaymentMethodButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : AppColors.backgroundColor,
          border: Border.all(color: AppColors.stroke),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(  
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: isActive
                  ? const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn)
                  : null,
            ),
            const SpaceHeight(10.0),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.backgroundColor : AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
