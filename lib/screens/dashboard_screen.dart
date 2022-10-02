import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/screens/cart_screen.dart';
import 'package:restaurant/screens/favourite_screen.dart';
import 'package:restaurant/screens/home_screen.dart';
import 'package:restaurant/screens/search_screen.dart';
import '';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;

    const List<Widget> widgetOptions = <Widget>[
      HomeScreen(),
      FavoriteScreen(),
      SearchScreen(),
      CartScreen(),
    ];

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
            width: mWidth,
            height: mHeight / 11,
            margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                backgroundColor: Colors.black,
                items: const[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                    backgroundColor: Colors.black
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: '',
                      backgroundColor: Colors.black
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: '',
                      backgroundColor: Colors.black
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: '',
                      backgroundColor: Colors.black
                  ),
                ],
                currentIndex: selectedIndex,
                selectedItemColor: Colors.amber,
                unselectedItemColor: Colors.white,
                onTap: onItemTapped,
              ),
            )),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
    );
  }
}
