import 'package:flutter/material.dart';

class BestSellersWidget extends StatelessWidget {
  const BestSellersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                top: 15,
              ),
              child: Text(
                'Best seellers in Electronics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              shrinkWrap: true,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: [
                itemCard(image: 'assets/image7/item_7.jpeg'),
                itemCard(image: 'assets/image7/item_5.jpeg'),
                itemCard(image: 'assets/image7/item_6.jpeg'),
                itemCard(image: 'assets/image7/item_4.jpeg')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemCard({required String? image}) {
    return Card(
      elevation: .0,
      margin: EdgeInsets.zero,
      child: Image.asset(
        image!,
        fit: BoxFit.cover,
      ),
    );
  }
}
