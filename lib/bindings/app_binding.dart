import 'package:ecommerce_app/controllers/card_controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CardController());
  }
}