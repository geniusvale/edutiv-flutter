import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/course/course_viewmodel.dart';
import '../screen.dart';

class MainPage extends StatefulWidget {
  int? id;
  int? index;
  MainPage({Key? key, this.id, this.index}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CourseScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCategory();
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    // Provider.of<ProfileViewModel>(context, listen: false)
    //     .getUserById(widget.id!);
    currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final newIndex = ModalRoute.of(context)?.settings.arguments as int;

    // currentIndex = newIndex;

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
