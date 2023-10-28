//Route names
import 'package:flutter/material.dart';
import 'package:music_player/system_pages/home_screen.dart';

const String homeScreen = 'home';
const String playlistScreen = 'playlists';
const String songScreen = 'song';

//control page routes flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case playlistScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case songScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    default:
      throw('');

  }
}
