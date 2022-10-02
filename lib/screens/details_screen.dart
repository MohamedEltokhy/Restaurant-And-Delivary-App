import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';

import '../common/head_details_screen.dart';
import '../controller/details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var data;
  bool fav = false;

  @override
  void initState() {
    data = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    data.clear;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;

    final DetailsController detailsController = Get.put(DetailsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.amber,
        ),
      ),
      body: Container(
        width: mWidth,
        height: mHeight,
        padding: const EdgeInsets.only(top: 20),
        color: Colors.amber,
        child: ListView(
          children: [
            //head
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: HeadDetails(
                backOnTap: () {
                  Get.back();
                },
                favOnTap: () {
                  setState(() {
                    fav = !fav;
                  });
                },
                color: fav == true ? Colors.red : Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: mHeight / 14, bottom: 10),
              height: mHeight / 1.223,
              color: Colors.amber,
              child: Stack(
                children: [
                  // body
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: mWidth,
                      height: mHeight / 1.6,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40))),
                      child: ListView(
                        children: [
                          // hottest img
                          Container(
                            margin: const EdgeInsets.only(top: 60, right: 30),
                            alignment: Alignment.bottomRight,
                            width: mWidth,
                            height: 60,
                            child: Image.asset("assets/img_8.png"),
                          ),
                          // title
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, right: 20, left: 20),
                            child: Text(
                              data[0],
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // rate
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: RatingStars(
                              value: double.parse(data[3]),
                              starCount: 5,
                              starSize: 20,
                              valueLabelColor: const Color(0xff9b9b9b),
                              valueLabelTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              valueLabelRadius: 10,
                              maxValue: 5,
                              starSpacing: 2,
                              maxValueVisibility: true,
                              valueLabelVisibility: true,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              valueLabelPadding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 8),
                              valueLabelMargin: const EdgeInsets.only(right: 8),
                              starOffColor: const Color(0xffe7e8ea),
                              starColor: Colors.yellow,
                            ),
                          ),
                          // details
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            height: mHeight / 6,
                            child: Text(
                              data[4],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ),
                          ),
                          // buttons
                          Container(
                            width: mWidth,
                            height: mHeight / 9,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 2, right: 2),
                            child: Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // left section
                                  Container(
                                    width: mWidth / 2.8,
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25),
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        detailsController.count >= 2
                                            ? InkWell(
                                                onTap: () {
                                                  detailsController.decrement();
                                                },
                                                child: const Text(
                                                  "-",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {},
                                                child: const Text(
                                                  "-",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                        Text(
                                          "${detailsController.count}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            detailsController.increment();
                                          },
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // right section
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: mWidth / 2,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 3,
                                            offset: const Offset(2,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add To Cart  ${detailsController.count * data[1]} \$",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // image
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: mWidth / 5, right: mWidth / 5),
                        width: mWidth / 2,
                        height: mHeight / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(
                                  8, 8), // changes position of shadow
                            ),
                          ],
                          color: Colors.black,
                        ),
                        child: Image.asset(data[2]),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
