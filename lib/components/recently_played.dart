import 'package:flutter/material.dart';
import '../constants.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          RecentCard(
            text: "Physical Handicap > Classroom",
            press: () {},
          ),

          RecentCard(
            text: "Physical Handicap > Cafe",
            press: () {},
          ),

          RecentCard(
            text: "Physical Handicap > Bus",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecentCard extends StatelessWidget {
  const RecentCard({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: press(),
        child: Container(
          padding: EdgeInsets.only(
              left: kDefaultPadding / 2, top: kDefaultPadding - 2),

          margin: EdgeInsets.only(
              left: kDefaultPadding / 2,
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding / 5),
          width: size.width * 0.95,
          height: 54,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: kPrimaryColor.withOpacity(0.23))
              ]),
          child: Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: "$text\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ));
  }
}