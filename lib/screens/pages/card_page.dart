import 'package:ecommerce_app/controllers/card_controller.dart';
import 'package:ecommerce_app/widgets/card_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class CardPage extends StatelessWidget {
  final cardController = Get.find<CardController>();
  CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        color: lightGrey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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

                  Text('سبد خرید',style: titleStyle,)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardController.cardItems.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemBuilder:  (context, index) {
                  var item = cardController.getItem(index);
                  return CardItemWidget(product: item!.key ,count: item.value,);
                },
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.all(14),
                decoration:const  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cardController.getPrice().toString() , style: titleStyle,),
                        Text('جمع سبد' , style: titleStyle.copyWith(color: grey),),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cardController.getPrice().toString() , style: titleStyle,),
                        Text('جمع پرداختی' , style: titleStyle,),

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
