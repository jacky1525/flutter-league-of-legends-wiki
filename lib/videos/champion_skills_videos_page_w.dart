import 'package:flutter/material.dart';
import 'package:flutter_json/model/champion_info_model.dart';
import 'package:video_player/video_player.dart';

class ChampionsSkillVideosPageW extends StatefulWidget {
  final ChampionInfoModel championInfo;
  const ChampionsSkillVideosPageW({super.key, required this.championInfo});

  @override
  State<ChampionsSkillVideosPageW> createState() =>
      _ChampionsSkillVideosPageWState();
}

class _ChampionsSkillVideosPageWState extends State<ChampionsSkillVideosPageW> {
  late VideoPlayerController _controller;

  late String newKey;

  @override
  void initState() {
    if (widget.championInfo.key.length == 2) {
      newKey = "0" + widget.championInfo.key;
      print(newKey);
    } else if (widget.championInfo.key.length == 1) {
      newKey = "00" + widget.championInfo.key;
      print(newKey);
    } else if (widget.championInfo.key.length == 3) {
      newKey = widget.championInfo.key;
    }

    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0${newKey}/ability_0${newKey}_W1.webm"))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.play();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lime,
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          size: 32,
          color: Colors.black54,
        ),
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
      ),
    );
  }
}
