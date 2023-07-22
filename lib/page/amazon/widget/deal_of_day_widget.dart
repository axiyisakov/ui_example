import 'package:flutter/material.dart';

class DealOfTheDayWidget extends StatelessWidget {
  const DealOfTheDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15),
            child: Text(
              'Deal of the day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: PhysicalModel(
              color: Colors.transparent,
              shadowColor: Colors.blue,
              elevation: 10,
              child: Image.asset(
                'assets/image7/item_7.jpeg',
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Up to 31% off APC UPS battery back',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 15, top: 5),
            child: Text(
              r'$10.99 - $79.9',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
