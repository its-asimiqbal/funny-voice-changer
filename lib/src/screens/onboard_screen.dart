import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/onboard-screens/screen1.dart';
import 'package:funny_voice_changer/src/onboard-screens/screen2.dart';
import 'package:funny_voice_changer/src/onboard-screens/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                Screen1(),
                Screen2(),
                Screen3(),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, right: 25),
              alignment: const Alignment(-0.9, 0.9),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const SlideEffect(
                      spacing: 5.0,
                      // radius: 4.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      // paintStyle: PaintingStyle.stroke,
                      // strokeWidth: 1.5,
                      // dotColor: Colors.grey,
                      activeDotColor: Colors.deepPurple,
                    ),
                  ),
                  const Spacer(),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'GET STARTED',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          },
                          child: const Text(
                            'NEXT',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                ],
              ),
            ),
            const Align(
                alignment: Alignment.bottomRight,
                child: Divider(
                  thickness: 2,
                  color: Colors.black12,
                )),
          ],
        ),
      ),
    );
  }
}