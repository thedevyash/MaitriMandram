import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/Marketplace/cart.dart';
import 'package:sehyogini_frontned/controllers/addRemoveCart.dart';
import 'package:sehyogini_frontned/controllers/getProducts_controller.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  GetProductController productController = Get.put(GetProductController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kriti-Srijan',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add cart functionality
              Get.to(MyCart());
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 40,
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: productController.products
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                          useSafeArea: true,
                          backgroundColor: Colors.white,
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            print(e.image!);
                            return Material(
                              child: Container(
                                padding: EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // SvgPicture.network(Uri.parse(e.image!)
                                    //     .toString()), //
                                    Image.network(e.image!),
                                    SizedBox(height: 10),
                                    Text(
                                      e.productName!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '₹${e.price!}',
                                      style: GoogleFonts.poppins(fontSize: 24),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      e.description!,
                                      style: GoogleFonts.poppins(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue,
                                      ),
                                      onPressed: () {
                                        addToCartController.addtocart(e.sId!);
                                      },
                                      child: Text(
                                        'Add to Cart',
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Card(
                        color: Colors.white, surfaceTintColor: Colors.white,
                        elevation: 5, // Add shadow
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Add rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10), // Add padding
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the start
                            children: [
                              AspectRatio(
                                  aspectRatio:
                                      1.1, // Control the aspect ratio of the image
                                  child: Image.network(e.image!)),
                              SizedBox(height: 10),
                              Text(
                                e.productName!,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight
                                        .bold), // Style the product name
                              ),
                              SizedBox(height: 5),
                              Text(
                                '₹${e.price!}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey), // Style the price
                              ),
                              Spacer(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  // Add to cart functionality
                                  addToCartController.addtocart(e.sId!);
                                },
                                child: Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        );
      }),
    );
  }
}
