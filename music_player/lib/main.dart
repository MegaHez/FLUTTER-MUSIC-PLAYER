import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/system_pages/home_screen.dart';
import 'package:music_player/system_pages/playlist_screen.dart';
import 'package:music_player/system_pages/song_screen.dart';

void main() {
  runApp(const MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MUSIC PLAYER',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white
            ),
      ),

      home: const SongScreen(),
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen()),
        GetPage(name: "/song", page: () => const SongScreen()),
        GetPage(name: "/playlist", page: () => const PlaylistScreen())
      ],
    );
  }
}
