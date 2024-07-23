import 'dart:collection';

import 'package:get/get.dart';

import '../models/product.dart';

class CardController extends GetxController{
    var cardItems = <Product, int>{}.obs;

    addItem(Product product,int count){
        if (cardItems.containsKey(product)) {
            cardItems[product] =  count;
        } else {
            cardItems[product] = count;
        }
    }

    double getPrice() {
        double price = 0;
        cardItems.forEach((product, count) {
            price += int.parse(product.price) *count;
        });
        return price;
    }
    MapEntry<Product, int>? getItem(index) {
        if (cardItems.length < index+1) {
            return null;
        }
        return cardItems.entries.elementAt(index);
    }


}