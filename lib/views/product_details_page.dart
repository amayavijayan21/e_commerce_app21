import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;

  ProductDetailPage({required this.productId});

  Future<Product> fetchProduct() async {
    final data = await ApiService.getProductById(productId);
    return Product.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: FutureBuilder<Product>(
        future: fetchProduct(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final product = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.image, height: 200),
                SizedBox(height: 20),
                Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("\$${product.price}", style: TextStyle(fontSize: 18, color: Colors.green)),
                SizedBox(height: 10),
                Text(product.description),
              ],
            ),
          );
        },
      ),
    );
  }
}
