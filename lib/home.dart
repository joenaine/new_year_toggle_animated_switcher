import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  bool visible = true;
  var animateBack = false;

  void toggleOpacity() {
    setState(() {
      visible = !visible;
    });
    if (animateBack) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setState(() {
          visible = !visible;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: visible ? 1 : 0,
                      duration: const Duration(milliseconds: 600),
                      child: const Text(
                        'WELCOME',
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 193, 12),
                            fontSize: 105),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: visible ? 0 : 1,
                      duration: const Duration(milliseconds: 600),
                      child: const Text(
                        'GOOD BYE',
                        style: TextStyle(color: Colors.red, fontSize: 110),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '2',
                      style: TextStyle(color: Colors.black, fontSize: 180),
                    ),
                    const SizedBox(width: 88),
                    Transform.scale(
                      scale: 4,
                      child: CupertinoSwitch(
                        value: visible,
                        trackColor: Colors.red,
                        onChanged: (value) {
                          toggleOpacity();
                        },
                      ),
                    ),
                    const SizedBox(width: 88),
                    const Text(
                      '2',
                      style: TextStyle(color: Colors.black, fontSize: 180),
                    ),
                    const SizedBox(width: 28),
                    Stack(
                      children: [
                        AnimatedOpacity(
                          opacity: visible ? 0 : 1,
                          duration: const Duration(milliseconds: 600),
                          child: const Text(
                            '2',
                            style: TextStyle(color: Colors.red, fontSize: 180),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: visible ? 1 : 0,
                          duration: const Duration(milliseconds: 600),
                          child: const Text(
                            '3',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 193, 12),
                                fontSize: 180),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
