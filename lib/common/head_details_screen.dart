import 'package:flutter/material.dart';


class HeadDetails extends StatelessWidget {

  const HeadDetails({Key? key, required this.backOnTap, required this.favOnTap, required this.color}) : super(key: key);
  final Function() backOnTap;
  final Function() favOnTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black
          ),
          child: IconButton(
            onPressed: backOnTap,
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
        ),
        const Text("Food Details",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black
          ),
          child: IconButton(
            onPressed: favOnTap,
            icon:  Icon(Icons.favorite,color: color,),
          ),
        ),
      ],
    );
  }
}
