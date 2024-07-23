import 'package:ecommerce_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularCategory extends StatelessWidget {
  final image;
  final title;
  const CircularCategory(this.image, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurpleAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(32))
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              height: 60,
              width: 60,
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text(title,style: subTitleStyle,)
      ],
    );
  }
}
