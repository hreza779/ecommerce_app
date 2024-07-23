import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/pages/card_page.dart';
import 'package:ecommerce_app/screens/pages/home_page.dart';
import 'package:ecommerce_app/widgets/circular_category.dart';
import 'package:ecommerce_app/widgets/product_card_widget.dart';
import 'package:ecommerce_app/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import '../controllers/slider_controller.dart';

class MainScreen extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  MainScreen({super.key});
  final List<Widget> pages = [
    HomePage(),
    CardPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return pages[bottomNavController.currentIndex.value];
        }),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: primaryColor,
          child:const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.home_outlined,color: Colors.white,),
          ),
          onPressed: (){
            bottomNavController.changePage(0);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx((){
          return AnimatedBottomNavigationBar(
            activeIndex: bottomNavController.currentIndex.value,
            onTap: (index){
              bottomNavController.changePage(index);
            },
            leftCornerRadius: 8,
            rightCornerRadius: 8,
            shadow: BoxShadow(),
            gapLocation: GapLocation.center,
            inactiveColor: grey,
            activeColor: grey,
            icons: [
              Icons.person_2_outlined,
              Icons.shopping_cart_outlined,
              Icons.favorite_border,
              Icons.grid_view_outlined,
            ],
          );
        }),
      ),
    );
  }
}
