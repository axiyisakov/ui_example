import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
    required int? currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 3; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentIndex == i ? 20 : 5,
              curve: Curves.ease,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(2.5)),
            ),
        ],
      ),
    );
  }
}
