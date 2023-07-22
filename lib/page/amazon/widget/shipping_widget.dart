import 'package:flutter/material.dart';

class ShippingWidget extends StatelessWidget {
  const ShippingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(children: [
        const Expanded(
            flex: 5,
            child: ColoredBox(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('We ship 45 mln pruducts'),
                ),
              ),
            )),
        Expanded(
            flex: 6,
            child: ColoredBox(
              color: Colors.white,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(75)),
                child: Image.asset(
                  'assets/image7/image_1.jpeg',
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
            ))
      ]),
    );
  }
}
