import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePageMusicPlayer extends StatefulWidget {
  const HomePageMusicPlayer({Key? key}) : super(key: key);

  @override
  State<HomePageMusicPlayer> createState() => _HomePageMusicPlayerState();
}

class _HomePageMusicPlayerState extends State<HomePageMusicPlayer> {
  bool isPlaying = false;
  double value = 0;

  // create an instance of the music player
  final audioPlayer = AudioPlayer();

  // setting the duration
  Duration? duration = const Duration(seconds: 0);

  // create function to initiate music into the player
  void initiateAudioPlayer() async {
    await audioPlayer.setSource(AssetSource("nipigie.mp3"));
    duration = await audioPlayer.getDuration();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiateAudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text("Music Streaming"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cover.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  "assets/cover.jpeg",
                  width: 240.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Summer Vibes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // This will be modified when the music stream
                   Text(
                    "${(value / 60).floor()} : ${(value % 60).floor()}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  Slider.adaptive(
                    onChanged: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                    min: 0.0,
                    max: duration!.inSeconds.toDouble(),
                    value: value,
                    onChangeEnd: (newValue) async {
                      setState(() {
                        value = newValue;
                        // print(newValue);
                      });
                      audioPlayer.pause();
                      await audioPlayer.seek(Duration(seconds: newValue.toInt()));
                      await audioPlayer.resume();
                    },
                    activeColor: Colors.white,
                  ),

                  // This will show the total duration of the song
                  Text(
                    "${duration!.inMinutes} : ${duration!.inSeconds % 60}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.black87,
                  border: Border.all(
                    color: Colors.purple,
                  ),
                ),


                child: InkWell(
                  onTap: () async {
                    //here will play the song

                    if(isPlaying){
                      await audioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      await audioPlayer.resume();
                      setState(() {
                        isPlaying = true;
                      });

                      //let track the duration value
                      audioPlayer.onPositionChanged.listen(
                            (position) {
                          setState(() {
                            value = position.inSeconds.toDouble();
                          });
                        },
                      );

                    }

                  },
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
