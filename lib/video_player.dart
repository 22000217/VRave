import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/main.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<HomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // VideoPlayerController를 저장하기 위한 변수를 만듭니다. VideoPlayerController는
    // asset, 파일, 인터넷 등의 영상들을 제어하기 위해 다양한 생성자를 제공합니다.
    _controller = VideoPlayerController.asset("asset/whiteOpen.mp4");

    _controller.play();

    // 컨트롤러를 초기화하고 추후 사용하기 위해 Future를 변수에 할당합니다.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 비디오를 반복 재생하기 위해 컨트롤러를 사용합니다.
    _controller.setLooping(false);

    _initializeVideoPlayerFuture.then((value) => {
        _controller.addListener(() {
          setState(() {
            if (!_controller.value.isPlaying &&_controller.value.isInitialized &&
                (_controller.value.duration ==_controller.value.position)) {
              
              //Video Loading Completed
              sleep(const Duration(seconds: 1));

              setState(() => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => MScreen())));
            }
          });
        })
      });

    super.initState();
  }

  @override
  void dispose() {
    // 자원을 반환하기 위해 VideoPlayerController를 dispose 시키세요.
    _controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // 영상을 보여주기 위해 VideoPlayer 위젯을 사용합니다.
              child: VideoPlayer(
                  _controller
                  ),
            );
            
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ) // 이 마지막 콤마는 build 메서드에 자동 서식이 잘 적용될 수 있도록 도와줍니다.
    );
  }
}