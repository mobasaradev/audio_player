import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControl extends StatelessWidget {
  const AudioControl({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  void seekSecBackward() {
    final currentPos = audioPlayer.position;
    if (currentPos >= const Duration(seconds: 30)) {
      audioPlayer.seek(currentPos - const Duration(seconds: 30));
    }
  }

  void seekSecForward() {
    final currentPos = audioPlayer.position;
    if ((audioPlayer.duration! - currentPos) >= const Duration(seconds: 30)) {
      audioPlayer.seek(currentPos + const Duration(seconds: 30));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: audioPlayer.seekToPrevious,
          icon: const Icon(Icons.skip_previous),
          color: Colors.white,
          iconSize: 40,
        ),
        IconButton(
          onPressed: seekSecBackward,
          icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
          color: Colors.white,
          iconSize: 40,
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: audioPlayer.play,
                icon: const Icon(Icons.play_arrow),
                color: Colors.white,
                iconSize: 40,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.pause,
                icon: const Icon(Icons.pause),
                color: Colors.white,
                iconSize: 40,
              );
            }
            return const Icon(
              Icons.play_arrow,
              color: Colors.grey,
            );
          },
        ),
        IconButton(
          onPressed: seekSecForward,
          icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
          color: Colors.white,
          iconSize: 40,
        ),
        IconButton(
          onPressed: audioPlayer.seekToNext,
          icon: const Icon(Icons.skip_next),
          color: Colors.white,
          iconSize: 40,
        ),
      ],
    );
  }
}
