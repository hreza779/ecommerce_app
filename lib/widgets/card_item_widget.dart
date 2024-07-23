import 'package:customizable_counter/customizable_counter.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/card_controller.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItemWidget extends StatelessWidget {
  final Product product;
  final int count;

  const CardItemWidget({super.key, required this.product, required this.count});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin:const  EdgeInsets.all(12.0),
          padding:const  EdgeInsets.all(10.0),
          decoration:const  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.image,height: 80,width: 80,),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,style: titleStyle,),
                  Text('کفش و کتانی',style: buttonTextStyle,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text(
                        product.price,
                        style:
                        buttonTextStyle.copyWith(color: Color(0xff2c2c2c)),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                      ),
                      const Image(
                        image: AssetImage('lib/images/rial.png'),
                        width: 15,
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: CustomizableCounter(
                      borderColor: Colors.white,
                      borderWidth: 1,
                      borderRadius: 100,
                      showButtonText: false,
                      backgroundColor: grey,
                      textColor: Colors.white,
                      textSize: 15,
                      count: count.toDouble(),
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
                         Get.find<CardController>().addItem(product, count1.toInt());
                      },
                      onIncrement: (count) {},
                      onDecrement: (count) {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
