import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main/components/my_bottom_navigation_bar.dart';
import 'package:main/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('asset/icons/menu.svg'),
        onPressed: () {},
      ),
    );
  }
}