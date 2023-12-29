import 'package:flutter/material.dart';

class ScrollToggleSwitcher extends StatefulWidget {
  const ScrollToggleSwitcher({super.key});

  @override
  State<ScrollToggleSwitcher> createState() => _ScrollToggleSwitcherState();
}

class _ScrollToggleSwitcherState extends State<ScrollToggleSwitcher> {
  PageController controller = PageController();
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
                duration: const Duration(seconds: 2),
                top: isSelected ? -300 : 300,
                curve: Curves.ease,
                child: const Text('2023',
                    style: TextStyle(color: Colors.white, fontSize: 110))),
            AnimatedPositioned(
                duration: const Duration(seconds: 2),
                top: isSelected ? 300 : -300,
                curve: Curves.ease,
                child: const Text('2024',
                    style: TextStyle(color: Colors.white, fontSize: 110))),
            PageView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              reverse: true,
              itemCount: 2,
              onPageChanged: (value) {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    index == 0
                        ? 'assets/light_bulb.png'
                        : 'assets/light_bulb_active.png',
                    height: 300,
                    color: Colors.white,
                  ),
                );
              },
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1200),
              bottom: isSelected ? -240 : 240,
              curve: Curves.ease,
              child: Container(
                margin: const EdgeInsets.only(top: 400),
                alignment: Alignment.bottomCenter,
                child: const Text('Good Bye',
                    style: TextStyle(color: Colors.white, fontSize: 50)),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1200),
              bottom: isSelected ? 240 : -240,
              curve: Curves.ease,
              child: Container(
                margin: const EdgeInsets.only(top: 400),
                alignment: Alignment.bottomCenter,
                child: const Text('Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
