import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  final index;
  final image;
  final title;
  final price;

  const ProductCardWidget(
      {super.key, this.index, this.image, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ProductController>().selectedProduct = index;
        Get.toNamed(Routes.PRODUCT);
      },
      child: Container(
        width: 130,
        height: 170,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child:Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: lightGrey,
                        ),
                        iconSize: 22,
                        padding: EdgeInsets.zero, // Remove default padding
                      ),
                    ),
                  ),
                ],
              )
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: subTitleStyle,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Image(
                        image: AssetImage('lib/images/rial.png'),
                        width: 15,
                        height: 15,
                      ),
                      Text(
                        price,
                        style:
                            buttonTextStyle.copyWith(color: Color(0xff2c2c2c)),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                      ),
                      IconButton(
                        alignment: AlignmentDirectional.centerEnd,
                        onPressed: () {},
                        icon: Icon(Icons.add_card_outlined,
                            size: 18, color: primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
