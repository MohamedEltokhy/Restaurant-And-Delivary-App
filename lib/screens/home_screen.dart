import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/home_meals.dart';
import '../common/home_category.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  String categoryMenu = "Main";

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: mHeight / 30),
        child: ListView(
          children: [
            // header
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        print('menu action');
                      },
                      child: Image.asset(
                        "assets/img_2.png",
                        width: mWidth / 12,
                        height: mHeight / 13,
                      )),
                  Image.asset(
                    "assets/img_3.png",
                    width: mWidth / 6,
                    height: mHeight / 11,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: mHeight / 20),
              child: const Text(
                "Good Chicken Fast \nDelivery.",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // list of category
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category(
                    title: "Main",
                    color: selectedCategory == 0 ? Colors.amber : Colors.black,
                    onTap: () {
                      setState(() {
                        selectedCategory = 0;
                        categoryMenu = "Main";
                        print('Main category');
                      });
                    },
                    image: "assets/img_4.png",
                  ),
                  Category(
                    title: "Combos",
                    color: selectedCategory == 1 ? Colors.amber : Colors.black,
                    onTap: () {
                      setState(() {
                        selectedCategory = 1;
                        categoryMenu = "Combos";
                        print('combos category');
                      });
                    },
                    image: "assets/img_4.png",
                  ),
                  Category(
                    title: "Sides",
                    color: selectedCategory == 2 ? Colors.amber : Colors.black,
                    onTap: () {
                      setState(() {
                        selectedCategory = 2;
                        categoryMenu = "Sides";
                        print('sides category');
                      });
                    },
                    image: "assets/img_5.png",
                  ),
                  Category(
                    title: "Drinks",
                    color: selectedCategory == 3 ? Colors.amber : Colors.black,
                    onTap: () {
                      setState(() {
                        selectedCategory = 3;
                        categoryMenu = "Drinks";
                        print('drinks category');
                      });
                    },
                    image: "assets/img_6.png",
                  ),
                ],
              ),
            ),
            // title
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: mHeight / 20),
              child: Text(
                categoryMenu,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // body
            Container(
                height: mHeight / 3.5,
                width: mWidth,
                margin: EdgeInsets.only(top: mHeight / 50, left: 20, right: 20),
                child: categoryMenu == "Main" ? ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HomeMeals(
                        title: "Jollof Rice with 1/4 Chicken & Plantain",
                        subTitle: "22 \$",
                        onTap: (){
                          Get.to(const DetailsScreen(), arguments: [
                            "Jollof Rice with 1/4 Chicken & Plantain",
                            22,
                            "assets/img_7.png",
                            "4.5",
                            "Lorem ipsum dolor sit amet,"
                                " consectetur adipiscing elit,"
                                " consectetur adipiscing elit,"
                                " consectetur adipiscing elit,"
                                " sed do eiusmod tempor incididunt ut labore et"
                          ]);
                        },
                        image: "assets/img_7.png"
                    ),
                    HomeMeals(
                        title: "1/2 BBQ Chicken",
                        subTitle: "42 \$",
                        onTap: (){
                          Get.to(const DetailsScreen(), arguments: [
                            "1/2 BBQ Chicken",
                            42,
                            "assets/img_9.png",
                            "4.3",
                            "Lorem ipsum dolor sit amet,"
                                " consectetur adipiscing elit,"
                                " consectetur adipiscing elit,"
                                " consectetur adipiscing elit,"
                                " sed do eiusmod tempor incididunt ut labore et"
                          ]);
                        },
                        image: "assets/img_9.png"
                    ),
                    HomeMeals(
                        title: "kilo Mix Gerl",
                        subTitle: "102 \$",
                        onTap: (){
                          Get.to(const DetailsScreen(), arguments: [
                            "kilo Mix Gerl",
                            102.5,
                            "assets/img_7.png",
                            "4.8",
                            "Lorem ipsum dolor sit amet,"
                                " consectetur adipiscing elit,"
                                " consectetur adipiscing elit,"
                                " consectetur adipiscing elit,"
                                " sed do eiusmod tempor incididunt ut labore et"
                          ]);
                        },
                        image: "assets/img_7.png"
                    ),
                  ],
                ):ListView()
            ),
          ],
        ),
      ),
    );
  }
}
