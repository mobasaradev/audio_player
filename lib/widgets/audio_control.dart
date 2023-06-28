import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControl extends StatelessWidget {
  const AudioControl({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  void seekBack() {
    final currentPos = audioPlayer.position;
    if (currentPos >= const Duration(seconds: 30)) {
      audioPlayer.seek(currentPos - const Duration(seconds: 30));
    }
  }

  void seekForward() {
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
          iconSize: 40,
          color: Colors.white,
          icon: const Icon(Icons.skip_previous_outlined),
        ),
        IconButton(
          onPressed: seekBack,
          iconSize: 40,
          color: Colors.white,
          icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final player = snapshot.data;
            final processingState = player?.processingState;
            final playing = player?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: audioPlayer.play,
                iconSize: 40,
                color: Colors.white,
                icon: const Icon(Icons.play_arrow_outlined),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.pause,
                iconSize: 40,
                color: Colors.white,
                icon: const Icon(Icons.pause_circle_outline),
              );
            }
            return const Icon(
              Icons.pause_circle_outline,
              size: 40,
            );
          },
        ),
        IconButton(
          onPressed: seekForward,
          iconSize: 40,
          color: Colors.white,
          icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
        ),
        IconButton(
          onPressed: audioPlayer.seekToNext,
          iconSize: 40,
          color: Colors.white,
          icon: const Icon(Icons.skip_next_outlined),
        ),
      ],
    );
  }
}
