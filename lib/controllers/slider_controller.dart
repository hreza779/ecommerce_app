import 'package:flutter/material.dart';

import '../models/slide.dart';

class SliderController{
    List<Slide> slides = [
      Slide('lib/images/banner1.png' , 'banner 1' , ''),
      Slide('lib/images/banner1.png' , 'banner 2' , ''),
      Slide('lib/images/banner1.png' , 'banner 3' , ''),
    ];

    List<Widget> generateSlider(){

     List<Widget> lst =  slides.map((item) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.fill,
              ),
            ),
          );
      } ).toList();

     return lst;
    }
}