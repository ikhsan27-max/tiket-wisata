import 'package:flutter/material.dart';

import 'package:tiket_wisata/semua_inputan.dart';
import '../models/product_models.dart';
import '../widgets/ticket_card_widget.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SpaceHeight(20.0),
        itemBuilder: (context, index) => TicketCard(
          item: products[index],
        ),
      ),
    );
  }
}
