import 'package:ecommerce_app/bindings/app_binding.dart';
import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:ecommerce_app/screens/product_screen.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  static List<GetPage> pages =[
    GetPage(
        name: Routes.HOME,
        page: () => MainScreen(),
        binding: AppBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.PRODUCT,
        page: () => const ProductScreen(),
        transition: Transition.fadeIn),
  ];
}