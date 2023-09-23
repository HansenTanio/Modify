import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/Models/FavoriteModel.dart';
import 'package:ujianprojectflutter/frontend/providers/favoriteProviders.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key, required this.item});

  final Item item;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer player = AudioPlayer();
  StreamSubscription? _sliderStream;
  Duration position = Duration.zero;
  late Duration duration;
  var uuid = const Uuid();
  bool _isPlaying = false;

  String getFormattedTime(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  Future setAudio() async {
    final songplayer = AudioCache(prefix: 'assets/');
    final file = await songplayer.load(widget.item.song);
    player.setUrl(file.path, isLocal: true);
  }

  @override
  void initState() {
    super.initState();
    duration = widget.item.duration;
    setAudio();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.PLAYING;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    _sliderStream?.cancel();
    player.stop();
    super.dispose();
  }

  // void startSliderStream() {
  //   const duration = Duration(seconds: 1);
  //   _sliderStream = Stream.periodic(duration, (_) {
  //     if (_currentSliderValue >= _maxSliderValue) {
  //       stopSliderStream();
  //       setState(() {
  //         _currentSliderValue = 0.0;
  //         _isPlaying = false;
  //       });
  //     } else {
  //       setState(() {
  //         _currentSliderValue += 1.0;
  //       });
  //     }
  //   });
  // }

  void startSliderStream() {
    const count = Duration(seconds: 1);
    final Stream _myStream = Stream.periodic(count, (_) {
      if (position >= duration) {
        stopSliderStream();
        setState(() {
          position = Duration.zero;
          _isPlaying = false;
        });
      } else {
        setState(() {
          position += count;
        });
      }
    });
  }

  void stopSliderStream() {
    _sliderStream?.cancel();
  }

  void _resetSlider() {
    setState(() {
      position = Duration.zero;
      _isPlaying = false;
      stopSliderStream();
      player.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FavoriteProvider>(context);

    // _maxSliderValue = double.parse(widget.item.duration.replaceAll(':', '.'));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Musik',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.item.cover),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${widget.item.title}',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${widget.item.subtitle}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Slider(
              inactiveColor: Colors.grey,
              activeColor: Colors.white,
              thumbColor: Colors.white,
              value: position.inSeconds.toDouble(),
              // value: _currentSliderValue,
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              // max: _maxSliderValue.toDouble() + 1.0,
              onChanged: (value) async {
                position = Duration(seconds: value.toInt());
                await player.seek(position);

                // await player.resume();
                // setState(() {
                //   _currentSliderValue = value;
                // });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getFormattedTime(position),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                ),
                Text(
                  getFormattedTime(duration),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                ),
                // Text(
                //   getFormattedTime(_currentSliderValue),
                //   style: TextStyle(fontSize: 16.0),
                // ),
                // Text(
                //   getFormattedTime(_maxSliderValue),
                //   style: TextStyle(fontSize: 16.0),
                // ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                hoverColor: Colors.grey,
                icon: Icon(Icons.repeat),
                onPressed: () {},
              ),
              IconButton(
                hoverColor: Colors.grey,
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  _resetSlider();
                },
              ),
              IconButton(
                hoverColor: Colors.grey,
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () async {
                  if (_isPlaying) {
                    // stopSliderStream();
                    await player.pause();
                  } else {
                    // startSliderStream();
                    await player.resume();
                  }
                  // setState(() {
                  //   _isPlaying = !_isPlaying;
                  //   if (_isPlaying) {
                  //     startSliderStream();
                  //   }
                  //   else {
                  //     stopSliderStream();
                  //   }
                  // });
                },
              ),
              IconButton(
                hoverColor: Colors.grey,
                icon: Icon(Icons.skip_next),
                onPressed: () {},
              ),
              IconButton(
                  hoverColor: Colors.grey,
                  icon: !prov.favoriteList.contains(widget.item)
                      ? Icon(Icons.favorite_border)
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    !prov.favoriteList.contains(widget.item)
                        ? prov.addFavorite(widget.item)
                        : prov.removeFavorite(widget.item);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
