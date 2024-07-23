import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/slider_controller.dart';
import '../../widgets/circular_category.dart';
import '../../widgets/product_card_widget.dart';
import '../../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    SliderController controller = SliderController();
    ProductController productController =Get.find<ProductController>();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.grid_view_rounded,
                      size: 22, color: accentColor),
                  style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: lightGrey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_outlined,
                      size: 22, color: accentColor),
                  style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: lightGrey),
                ),
              ],
            ),
          ),
          const SearchWidget(),
          CarouselSlider(
              items: controller.generateSlider(),
              options: CarouselOptions(
                autoPlay: true,
                height: 180,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularCategory('lib/images/jewellery.png', 'جواهرات'),
                CircularCategory('lib/images/shoes.png', 'کفش'),
                CircularCategory('lib/images/clothes.png', 'لباس'),
                CircularCategory('lib/images/beauty.png', 'زیبایی')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("آخرین محصولات", style: titleStyle,),
                  GestureDetector(
                    onTap: () {},
                    child:
                    const Text("مشاهده همه", style: buttonTextStyle,),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 176,
            child:  ListView.builder(
              itemCount: productController.products.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ProductCardWidget(
                    index: index,
                    image: productController.products[index].image,
                    title: productController.products[index].title,
                    price: productController.products[index].price,),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
