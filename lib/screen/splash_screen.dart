import 'package:flutter/material.dart';
import '../utils/constants.dart'; // Pastikan file constants.dart ada

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines, // Menambahkan maxLines untuk membatasi jumlah baris
    this.overflow, // Menambahkan overflow agar teks tidak terpotong tanpa kontrol
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines, // Batasi jumlah baris (jika diperlukan)
      overflow: overflow, // Tangani overflow (misal: TextOverflow.ellipsis)
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.textColor, // 🔹 Perbaikan: Menggunakan warna default dengan benar
      ),
    );
  }
}
