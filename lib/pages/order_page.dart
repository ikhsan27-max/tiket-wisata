import 'package:flutter/material.dart';

import '../components/space.dart';
import '../models/product_models.dart';
import 'order_detail_page.dart';
import '../extensions/ext.dart';
import '../extensions/build_context_ext.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjualan'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SpaceHeight(20.0),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                print('Product ${product.productName} tapped');
                
                context.push(OrderDetailPage(products: [product]));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Product image or icon if available
                    // If you had an image in your OrderCard, add it here
                    
                    const SizedBox(width: 12.0),
                    
                    // Product details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            '${product.type} - ${product.price.currencyFormatRp}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    
                    // Quantity
                    Text(
                      'Qty: ${product.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}