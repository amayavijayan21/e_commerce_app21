import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductListPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    productController.fetchProducts();

    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (productController.products.isEmpty) {
          return Center(child: Text("No products found"));
        }
        return RefreshIndicator(
          onRefresh: productController.fetchProducts,
          child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return ListTile(
                leading: Image.network(product.image, height: 50, width: 50),
                title: Text(product.title),
                subtitle: Text("\$${product.price}"),
                onTap: () => Get.toNamed('/product/${product.id}'),
              );
            },
          ),
        );
      }),
    );
  }
}
