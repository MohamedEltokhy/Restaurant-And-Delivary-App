import 'package:flutter/material.dart';


class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
      width: mWidth,
      height: mHeight/6,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 3,
            offset: const Offset(
                2, 4), // changes position of shadow
          ),
        ],
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/img_7.png",width: mWidth/4,),
          Column(
            children:  [
              const SizedBox(height: 20,),
              const Text("1/2 meals",style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 10,),
              const Text("22 \$",style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 10,),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "-",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const Text(
                    "3",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  InkWell(
                    onTap: () {

                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )],
              )
            ],
          ),
          const Icon(Icons.delete_forever,color: Colors.amber,),
          const SizedBox()
        ],
      ),
    );
  }
}
