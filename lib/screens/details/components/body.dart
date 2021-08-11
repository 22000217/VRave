import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/models/scinario.dart';
import 'package:main/screens/details/components/scene_card.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, bottom: kDefaultPadding),
          child: Text(
            "Physical Handicap",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: GridView.builder(
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPadding,
              crossAxisSpacing: kDefaultPadding,
              childAspectRatio: 0.80,
            ),
            itemBuilder: (context, index) =>
                SceneCard(sinario: sinarios[index], press: () {}),
          ),
        ))
      ],
    );
  }
}