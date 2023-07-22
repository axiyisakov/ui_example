import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson_g/page/intro/widgets/custom_widget_exporter.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  late int? _currentIndex;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (newIndex) {
              _currentIndex = newIndex;
              setState(() {});
            },
            children: const [
              SizedBox(
                width: double.infinity,
                child: IntroCardWidget(
                  image: 'assets/image_1/image_1.png',
                  title: 'Learn from experts',
                  subtitle: 'Select from top instructros around the world',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: IntroCardWidget(
                  image: 'assets/image_1/image_2.png',
                  title: 'Learn from experts',
                  subtitle: 'Select from top instructros around the world',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: IntroCardWidget(
                  image: 'assets/image_1/image_3.png',
                  title: 'Learn from experts',
                  subtitle: 'Select from top instructros around the world',
                ),
              ),
            ],
          ),
          if (_currentIndex == 2)
            Positioned(
                top: 30,
                right: 10,
                child: TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print('pressed');
                    }
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                )),
          Positioned(
              bottom: 20, child: IndicatorWidget(currentIndex: _currentIndex)),
        ],
      ),
    );
  }
}
