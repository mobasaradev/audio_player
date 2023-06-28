import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/model/audio_position.dart';
import 'package:music_player/widgets/audio_control_bar.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;

  Stream<AudioPosition> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, AudioPosition>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, buffered, duration) => AudioPosition(
          position,
          buffered,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setAsset('assets/audio/shameless.mp3');
    _init;
  }

  Future<void> get _init async {
    await _audioPlayer.setLoopMode(LoopMode.all);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF021367), Color(0xFF270054)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // audio duration progressBar
                  StreamBuilder<AudioPosition>(
                    stream: _positionDataStream,
                    builder: (context, snapshot) {
                      final progressBar = snapshot.data;
                      return ProgressBar(
                        progress: progressBar?.position ?? Duration.zero,
                        buffered: progressBar?.buffered ?? Duration.zero,
                        total: progressBar?.duration ?? Duration.zero,
                        onSeek: _audioPlayer.seek,
                        timeLabelTextStyle:
                            const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  // Audio control bar
                  AudioControl(audioPlayer: _audioPlayer),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
