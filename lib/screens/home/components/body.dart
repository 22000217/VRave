import 'package:flutter/material.dart';
import 'package:main/components/contents.dart';
import 'package:main/components/header_with_searchbox.dart';
import 'package:main/components/recently_played.dart';
import 'package:main/components/title_with_morebutton.dart';
import 'package:main/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final moreButtonStyle = TextButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreButton(
            moreButtonStyle: moreButtonStyle,
            title: "Contents",
            press: () {},
          ),
          Contents(),
          TitleWithMoreButton(
              moreButtonStyle: moreButtonStyle,
              title: "Recently Played",
              press: () {}),
          RecentlyPlayed(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}