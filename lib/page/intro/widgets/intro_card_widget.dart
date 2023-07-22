import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class IntroCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const IntroCardWidget(
      {Key? key,
      required this.image,
      required this.subtitle,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double?>(
      fps: 60,
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: value,
            child: Image.asset(
              image,
              width: 300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Transform.translate(
            offset: Offset(0, -value! * 10),
            child: Opacity(
              opacity: value,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Transform.translate(
              offset: Offset(0, -value * 10),
              child: Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
