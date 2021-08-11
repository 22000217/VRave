import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/models/scinario.dart';
import '../../../constants.dart';
import 'loader_screen.dart';

class SceneCard extends StatelessWidget {
  const SceneCard({
    Key? key,
    required this.press,
    required this.sinario,
  }) : super(key: key);

  final Function press;
  final Sinario sinario;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          height: 180,
          // width: 160,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
          child: GestureDetector(
            child: Image.asset(
              sinario.image,
              color: Colors.white,
            ),
            onTap: () {
              print("Container clicked");
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoaderScreen()));
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            sinario.title,
            style: TextStyle(color: kMinaryColor),
          ),
        ),

      ],
    );
  }
}