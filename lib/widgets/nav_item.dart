import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiket_wisata/constants/colors.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int? badgeCount;
  final Color? activeColor; 
  final Color? inactiveColor; 
  final double iconSize; 
  final double fontSize; 
  final EdgeInsets padding; 

  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badgeCount,
    this.activeColor,
    this.inactiveColor,
    this.iconSize = 24.0,
    this.fontSize = 10.0, 
    this.padding = const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), 
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColorToUse = activeColor ?? AppColors.primaryColor;
    final Color inactiveColorToUse = inactiveColor ?? AppColors.navInActive;

    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Container(

        width: 70, 
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: SvgPicture.asset(
                      iconPath,
                      colorFilter: ColorFilter.mode(
                        isActive ? activeColorToUse : inactiveColorToUse,
                        BlendMode.srcIn,
                      ),
                      // Fit memastikan ikon tidak melebihi ukuran
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  if (badgeCount != null && badgeCount! > 0)
                    Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        padding: const EdgeInsets.all(2), 
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Center(
                          child: Text(
                            badgeCount! > 9 ? '9+' : badgeCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize - 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 2.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  color: isActive ? activeColorToUse : inactiveColorToUse,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
                
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}