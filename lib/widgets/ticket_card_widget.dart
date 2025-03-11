import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiket_wisata/semua_inputan.dart';
import '../dialogs/delete_ticket_dialog.dart';
import '../models/product_models.dart';

class TicketCard extends StatelessWidget {
  final Product item;
  const TicketCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      item.type,
                      style: const TextStyle(fontSize: 11.0),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DeleteTicketDialog(),
                  );
                },
                icon: SvgPicture.asset(Assets.icons.tambahan.delete),
              ),
            ],
          ),
          const SpaceHeight(8.0),
          Text(
            item.price.currencyFormatRp,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
