import 'package:customizable_counter/customizable_counter.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/card_controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var count=0;
    Product product = Get.find<ProductController>().getSelectedProduct();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: lightGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded,
                              size: 22, color: accentColor),
                          style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share,
                              size: 22, color: accentColor),
                          style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.title,
                          style: titleStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Image(
                              image: AssetImage('lib/images/rial.png'),
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              product.price,
                              style: titleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "رنگ بندی",
                              style: subTitleStyle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          product.description,
                          style: subTitleStyle,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: accentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primaryColor)),
                  onPressed: () {
                      Get.find<CardController>().addItem(product, count);

                  },
                  child: Text(
                    "افزودن به سبد",
                    style: subTitleStyle.copyWith(color: Colors.white),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CustomizableCounter(
                  borderColor: Colors.white,
                  borderWidth: 1,
                  borderRadius: 100,
                  showButtonText: false,
                  backgroundColor: accentColor,
                  textColor: Colors.white,
                  textSize: 15,
                  count: 1,
                  step: 1,
                  minCount: 1,
                  maxCount: 10,
                  incrementIcon: const Icon(
                    Icons.add,
                    size: 14,
                    color: Colors.white,
                  ),
                  decrementIcon: const Icon(
                    Icons.remove,
                    size: 14,
                    color: Colors.white,
                  ),
                  onCountChange: (count1) {
                    count = count1.toInt();
                  },
                  onIncrement: (count) {},
                  onDecrement: (count) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
