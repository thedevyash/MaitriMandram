import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/controllers/addRemoveCart.dart';
import 'package:sehyogini_frontned/controllers/getUserCart.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  GetUserCartController userCartController = Get.put(GetUserCartController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  @override
  void initState() {
    userCartController.getUserCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TextButton(
        style: TextButton.styleFrom(
          fixedSize: Size(300, 50),
          primary: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () async {
          const url =
              'https://payments.coffeecodes.in/payments/0b579657-c332-4ec7-9550-f98b3c03d2b6';

          await launchUrl(Uri.parse(url));
        },
        child: Text("Proceed to payment"),
      ),
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        if (userCartController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (userCartController.products.isEmpty) {
          return Center(
            child: Text("No items in cart"),
          );
        }
        double subtotal = 0;
        userCartController.products.forEach((product) {
          subtotal += double.parse(product.product!.price!) * product.quantity!;
        });
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              shrinkWrap: true,
              itemCount: userCartController.products.length,
              itemBuilder: (context, index) {
                return Card(
                  surfaceTintColor: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Image.network(userCartController
                                .products[index].product!.image!)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  userCartController
                                      .products[index].product!.productName!
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  'Quantity: ${userCartController.products[index].quantity}',
                                  style: TextStyle(fontSize: 16.0)),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (userCartController
                                                .products[index].quantity! >
                                            1) {
                                          // Decrease the quantity if it's more than 1
                                          userCartController.products[index]
                                              .quantity = userCartController
                                                  .products[index].quantity! -
                                              1;
                                        } else {
                                          // Remove the product from the cart if the quantity is 1
                                          userCartController.products[index]
                                              .quantity = userCartController
                                                  .products[index].quantity! -
                                              1;
                                          addToCartController
                                              .removeFromCart(userCartController
                                                  .products[index]
                                                  .product!
                                                  .sId!)
                                              .then((_) {
                                            // If necessary, you can fetch the updated cart from the server here
                                            // userCartController.getUserCart();
                                          });
                                          userCartController.products
                                              .removeAt(index);
                                        }
                                      });

                                      // Then perform the server operation in the background
                                      addToCartController
                                          .removeFromCart(userCartController
                                              .products[index].product!.sId!)
                                          .then((_) {
                                        // If necessary, you can fetch the updated cart from the server here
                                        // userCartController.getUserCart();
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        // Decrease the quantity if it's more than 1
                                        userCartController.products[index]
                                            .quantity = userCartController
                                                .products[index].quantity! +
                                            1;
                                      });

                                      // Then perform the server operation in the background
                                      addToCartController
                                          .addtocart(userCartController
                                              .products[index].product!.sId!)
                                          .then((_) {
                                        // If necessary, you can fetch the updated cart from the server here
                                        // userCartController.getUserCart();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                            '₹${int.parse(userCartController.products[index].product!.price!) * userCartController.products[index].quantity!}',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
            Text("Subtotal: ₹$subtotal",
                style: GoogleFonts.poppins(fontSize: 20)),
          ],
        );
      }),
    );
  }
}
