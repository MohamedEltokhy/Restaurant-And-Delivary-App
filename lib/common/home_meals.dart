import 'package:flutter/material.dart';


class HomeMeals extends StatelessWidget {
  const HomeMeals({Key? key, required this.title, required this.subTitle, required this.onTap, required this.image}) : super(key: key);

  final String title;
  final String subTitle;
  final Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
        width: mWidth / 2,
        height: mHeight / 3,
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(right: 10, top: mHeight / 16, bottom: 10, left: 10),
                width: mWidth / 2.5,
                height: mHeight / 4,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(
                          2, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                       Text(title,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(subTitle,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),),
                          Image.asset("assets/img_8.png",width: 40,height: 40,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 1,
              bottom: 1,
              left: 10,
              right: 10,
              child: ClipRRect(
                child: Container(
                  margin: EdgeInsets.only(right: mWidth/9, top: mHeight/120, bottom: mHeight/7,left: mWidth/9),
                  width: mWidth/2.2,
                  height: mHeight/3,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(
                            4, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: Image.asset(image),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
