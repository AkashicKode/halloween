import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Halloween'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;
  int tmCount = 30;
  int _clickcount = 0;

  final _iconList = <Ink>[
    Ink.image(
      image: const AssetImage("bat.png"),
      width: 100,
      height: 100,
    ),
    Ink.image(
      image: const AssetImage("candy.png"),
      width: 100,
      height: 100,
    ),
    Ink.image(
      image: const AssetImage("pumpkin.png"),
      width: 100,
      height: 100,
    ),
    Ink.image(
      image: const AssetImage("white.png"),
      width: 100,
      height: 100,
    ),
    Ink.image(
      image: const AssetImage("white.png"),
      width: 100,
      height: 100,
    ),
    Ink.image(
      image: const AssetImage("witch.png"),
      width: 100,
      height: 100,
    ),
  ];

  void startGame() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (tmr) {
      if (_clickcount < 10) {
        if (tmCount > 0) {
          setState(() {
            tmCount--;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _clickcount < 10
              ? "${widget.title}     -     Score: $_clickcount    -    Time Left: $tmCount"
              : "Happy Halloween!"),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(16, (index) {
            int ran = Random().nextInt(6);
            return IconButton(
              icon: _iconList[ran],
              iconSize: 50,
              onPressed: (ran == 3 || ran == 4)
                  ? null
                  : () {
                      if (_clickcount < 10) {
                        _clickcount++;
                        setState(() {});
                      }
                    },
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: startGame,
          tooltip: 'Start',
          child: const Icon(Icons.start_sharp),
        )
      );
  }
}