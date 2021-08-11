import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:main/constants.dart';

class LoaderScreen extends StatefulWidget {
  LoaderScreen({Key? key}) : super(key: key);
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {

  late UnityWidgetController _unityWidgetController;
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar ? AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
            Navigator.of(context).pop();
          }
        ),
      ) : null,
      body: Card(
        margin: const EdgeInsets.all(0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: <Widget>[
            UnityWidget(
              onUnityCreated: onUnityCreated,
              onUnityMessage: onUnityMessage,
              fullscreen: true,
            ),
            GestureDetector(
                onTap: () {
                  print("Show Appbar");
                  setState(() {
                    _showAppBar = !_showAppBar;
                  });
                }
            ),
          ],
        ),
      ),
    );
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}