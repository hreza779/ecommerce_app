import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Color(0xffe3e3e3),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 22, color: grey),
            ),
            Text('جست و جو' , style: buttonTextStyle,textDirection: TextDirection.rtl,),

          ],
        ),
      ),
    );
  }
}
