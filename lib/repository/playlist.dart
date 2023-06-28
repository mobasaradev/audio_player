import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class PlayList {
  final playList = ConcatenatingAudioSource(
    children: [
      AudioSource.asset(
        'assets/audio/Perfect.mp3',
        tag: MediaItem(
          id: "1",
          title: "Perfect (Official Music)",
          artist: "Ed Sheeran",
          artUri: Uri.parse(
            "https://th.bing.com/th/id/OIP.-9pwscV6dxYMzrJpE8tR4gAAAA?pid=ImgDet&rs=1",
          ),
        ),
      ),
      AudioSource.asset(
        'assets/audio/shameless.mp3',
        tag: MediaItem(
          id: "2",
          title: "Shameless Stream Shameless",
          artist: "Camila Cabello ",
          artUri: Uri.parse(
            "https://th.bing.com/th/id/OIP.HHTHSmuTyFSBPoJ_0PechgHaHa?pid=ImgDet&w=1400&h=1400&rs=1",
          ),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://traffic.megaphone.fm/ADV9180667884.mp3?updated=1540921195"),
        tag: MediaItem(
          id: "3",
          title: "Dark Net Dairy of internet",
          artist: "fm90.4",
          artUri: Uri.parse(
            'https://i.pinimg.com/originals/2d/17/9a/2d179a29db89415fdf8fa8a0571dc7f0.jpg',
          ),
        ),
      ),
      AudioSource.uri(
        Uri.parse("https://traffic.megaphone.fm/ADV3675761065.mp3"),
        tag: MediaItem(
          id: "4",
          title: "Fm90.4 Podcast",
          artist: "Public Domain with RJ",
          artUri: Uri.parse(
              "https://i.pinimg.com/564x/7e/27/42/7e2742427951dc38db0b79bc39d49045.jpg"),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://traffic.megaphone.fm/ADV5119980399.mp3?updated=1567897111"),
        tag: MediaItem(
          id: "5",
          title: "Fm99.4 Podcast",
          artist: "Public Domain with RJ",
          artUri: Uri.parse(
              "https://i.pinimg.com/564x/2c/16/32/2c163275f082ad6f97392293f84d5702.jpg"),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://traffic.megaphone.fm/ADV8575485155.mp3?updated=1658803384"),
        tag: MediaItem(
          id: "6",
          title: "Fm88.8 Podcast",
          artist: "Public Domain with RJ",
          artUri: Uri.parse(
              "https://i.pinimg.com/564x/5e/13/e6/5e13e6d4cf9056c33985dca3a002faf7.jpg"),
        ),
      ),
    ],
  );
}
