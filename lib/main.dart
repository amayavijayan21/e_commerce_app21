// import 'package:flutter/material.dart';


// void main() {
//   runApp(const E_Commerce());
// }

// class E_Commerce extends StatelessWidget {
//   const E_Commerce({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: Home(),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/login_page.dart';
import 'views/product_details_page.dart';
import 'views/product_list_page.dart';


void main() {
  runApp(E_Commerce());
}

class E_Commerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  LoginPage()),
        GetPage(name: '/products', page: () => ProductListPage()),
        GetPage(
          name: '/product/:id',
          page: () {
            final id = int.parse(Get.parameters['id']!);
            return ProductDetailPage(productId: id);
          },
        ),
      ],
    );
  }
}
