import 'package:flutter/material.dart';
import 'package:fooddelivery/profile.dart';
import 'package:fooddelivery/wallet.dart';


import 'Home.dart';
import 'order.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Wallet wallet;
  late Order order;
  late Profile profile;

  @override
  void initState() {
    super.initState();
    homePage = Home();
    order = Order();
    profile = Profile();
    wallet = Wallet();

    pages = [homePage, order, wallet, profile];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTabIndex], // Set the body to the current page based on the index
      bottomNavigationBar: Container(
        height: 65, // Set the height of the bottom navigation bar
        color: Colors.black, // Set the background color to black
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          selectedItemColor: Color.fromARGB(255, 185, 32, 32), // Set the color of the selected icon
          unselectedItemColor: Color.fromARGB(255, 70, 177, 20).withOpacity(0.6), // Set the color of the unselected icons
          backgroundColor: Colors.black, // Set the background color to black
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
