import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson_g/consts/consts.dart';
import 'package:lesson_g/page/amazon/widget/best_sellers_widget.dart';
import 'package:lesson_g/page/amazon/widget/button_widget.dart';
import 'package:lesson_g/page/amazon/widget/deal_of_day_widget.dart';
import 'package:lesson_g/page/amazon/widget/shipping_widget.dart';

class AmazonView extends StatefulWidget {
  const AmazonView({super.key});

  @override
  State<AmazonView> createState() => _AmazonViewState();
}

class _AmazonViewState extends State<AmazonView> {
  final ScrollController _controller = ScrollController();
  double _angle = 0;
  void rotateContainer() {
    _controller.addListener(() {
      if (kDebugMode) {
        _angle = _controller.position.pixels / 1000;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    rotateContainer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: AppConsts.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppConsts.primaryColorAmazon,
        elevation: .0,
        bottomOpacity: .0,
        title: Image.asset(
          'assets/image7/amazon_logo.png',
          width: 90,
        ),
        actions: const [
          Icon(Icons.mic),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: AppConsts.primaryColorAmazon),
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppConsts.primaryColorAmazon,
                  ),
                  suffixIcon: const Icon(
                    Icons.camera_alt_sharp,
                    color: AppConsts.primaryColorAmazon,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  contentPadding: const EdgeInsets.only(top: 8, left: 8),
                  fillColor: Colors.white,
                  hintText: 'What are you looking for?',
                  filled: true),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                locationWidget,
                const ShippingWidget(),
                const SizedBox(
                  height: 10,
                ),
                const ButtonWidget(),
                const SizedBox(
                  height: 10,
                ),
                Transform.rotate(
                    angle: pi * _angle, child: const DealOfTheDayWidget()),
                const SizedBox(
                  height: 10,
                ),
                const BestSellersWidget()
              ],
            ),
          )),
        ],
      )),
    );
  }

  Widget get locationWidget {
    return const Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        tileColor: AppConsts.locationColor,
        dense: true,
        title: Text(
          'Deliver to Uzbekistan',
          style: TextStyle(color: Colors.white),
        ),
        minVerticalPadding: .0,
        minLeadingWidth: 5,
        horizontalTitleGap: 5,
        leading: Icon(Icons.location_on, color: Colors.white),
      ),
    );
  }
}
