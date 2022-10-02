import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.title, required this.color, required this.onTap, required this.image}) : super(key: key);

  final String title;
  final Color color;
  final Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: mWidth/5,
            height: mHeight/9,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(4, 4), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Image.asset(image,width: mWidth/7,height: mHeight/20,)),
          ),
        ),
         Text(title,style: const TextStyle(
            color: Colors.grey
        ),)
      ],
    );
  }
}
