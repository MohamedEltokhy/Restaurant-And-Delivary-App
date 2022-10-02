import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/cart_list_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
      ),
      body: SizedBox(
        width: mWidth,
        height: mHeight,
        child: Column(
          children: [
            // title
            Container(
              width: mWidth,
              height: mHeight/7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90)
                ),
                color: Colors.black,
              ),
              child: const Center(
               child: Text("My Cart",style: TextStyle(
                 color: Colors.amber,
                 fontSize: 24,
                 fontWeight: FontWeight.bold
               ),),
              ),
            ),
            const SizedBox(height: 20,),
            // body
            Expanded(
              // child: Center(
              //   child: Image.asset("assets/emptycart.png"),
              // ),
              child: ListView(
                shrinkWrap: true,
                children: const [
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                  CartItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
