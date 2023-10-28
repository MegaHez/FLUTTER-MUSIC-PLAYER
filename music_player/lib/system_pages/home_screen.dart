import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_model.dart';

import '../models/song_model.dart';
import '../widgets/playlist_card.dart';
import '../widgets/section_header.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomerAppBar(),
        bottomNavigationBar: const _CustomerNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SectionHeader(title: 'Playlists'),
                    ListView.builder(
                      itemCount: playlists.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PlaylistCard(playlist: playlists[index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20.0,
        left: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: "Trending Music"),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome", style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 5),
          Text(
            "Enjoy your favorites music",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                )),
          )
        ],
      ),
    );
  }
}

class _CustomerNavBar extends StatelessWidget {
  const _CustomerNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "Favorites"),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline), label: "Play"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline), label: "Profile"),
      ],
    );
  }
}

class _CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            // if you are using network image
            //backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"),

            // if you are using local images from assets
            backgroundImage: ExactAssetImage('assets/cover.jpeg'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
