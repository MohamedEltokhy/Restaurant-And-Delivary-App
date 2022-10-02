import 'package:get/get.dart';

class DetailsController extends GetxController{
  var count = 1.obs;
  increment() => count++;
  decrement() => count--;


  RxBool isAddToCart = false.obs;

  changeAddToCart()
  {
    isAddToCart.toggle();
  }



}