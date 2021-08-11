import 'package:flutter/material.dart';
import 'package:main/screens/details/details_screen.dart';
import '../constants.dart';

class Contents extends StatelessWidget {
  const Contents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ContentsCard(
            color: Colors.white,
            image: "asset/images/image_1.png",
            title: "Physical Handicap",
            description: "Description",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsScreen()));
            },
          ),

          ContentsCard(
            color: Colors.white,
            image: "asset/images/image_2.png",
            title: "Visual Handicap",
            description: "Description",
            press: () {},
          ),

          ContentsCard(
            color: kPrimaryColor,
            image: "asset/images/image_3.png",
            title: "",
            description: "",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ContentsCard extends StatelessWidget {
  const ContentsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.press,
    required this.color,
  }) : super(key: key);

  final String image, title, description;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2 + 1,
          bottom: kDefaultPadding * 2.5),
      width: size.width * 0.35,
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                this.press();
              },
              child: Image.asset(image)),

          GestureDetector(
            onTap: () {
              this.press();
            },

            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: color,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23))
                  ]),
              child: Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "$title\n",
                        style: Theme.of(context).textTheme.button),

                    TextSpan(
                        text: "$description",
                        style: TextStyle(color: kPrimaryColor.withOpacity(0.5)))
                  ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}