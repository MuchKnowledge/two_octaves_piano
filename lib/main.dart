import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_two_octaves_piano/sounds.dart';

void main() => runApp(MyApp());

final player = getPlayer();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black87,
            body: SafeArea(
              child: Stack(children: <Widget>[
                getWhitePianoRoll(),
                getBlackPianoRoll(),
              ]),
            )));
  }
}

Widget getWhitePianoRoll() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getWhiteButton(25),
        getWhiteButton(23),
        getWhiteButton(22),
        getWhiteButton(20),
        getWhiteButton(18),
        getWhiteButton(17),
        getWhiteButton(15),
        getWhiteButton(13),
        getWhiteButton(11),
        getWhiteButton(10),
        getWhiteButton(8),
        getWhiteButton(6),
        getWhiteButton(5),
        getWhiteButton(3),
        getWhiteButton(1),
      ],
    );

Widget getBlackPianoRoll() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getBlackButton(24),
          SizedBox(height: 40),
          getBlackButton(21),
          getBlackButton(19),
          SizedBox(height: 40),
          getBlackButton(16),
          getBlackButton(14),
          getBlackButton(12),
          SizedBox(height: 40),
          getBlackButton(9),
          getBlackButton(7),
          SizedBox(height: 40),
          getBlackButton(4),
          getBlackButton(2),
        ],
      ),
    );

Widget getWhiteButton(int id) => Container(
      child: GestureDetector(onTapDown: (TapDownDetails details) {
        player.play(getSounds(id));
      }),
      height: 64,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 0.1),
    );

Widget getBlackButton(int id) => Container(
      child: GestureDetector(onTapDown: (TapDownDetails details) {
        player.play(getSounds(id));
      }),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 32,
      width: 128,
      color: Colors.black87,
    );

AudioCache getPlayer() => AudioCache(prefix: 'sax/');
