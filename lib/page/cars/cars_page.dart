import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lesson_g/model/car_model.dart';
import 'package:lesson_g/page/cars/widget/cars_widget.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  final List? carColors = ['All', 'Red', 'Blue', 'Green', "Yellow"];
  String? currentColor = 'All';
  int? _counter = 0;
  List<CarModel?> cars = [
    CarModel(
        fuel: 'Electric',
        name: 'Corvette',
        image: 'assets/images_2/im_car1.jpg',
        isFavourite: false,
        price: r'100K$'),
    CarModel(
        fuel: 'Electric',
        name: 'Pagani',
        isFavourite: false,
        image: 'assets/images_2/im_car2.jpg',
        price: r'100K$'),
    CarModel(
        fuel: 'Electric',
        name: 'Mazda',
        isFavourite: false,
        image: 'assets/images_2/im_car3.jpg',
        price: r'100K$'),
    CarModel(
        fuel: 'Electric',
        name: 'Rockstar',
        isFavourite: false,
        image: 'assets/images_2/im_car5.jpg',
        price: r'100K$'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: .0,
        bottomOpacity: .0,
        title: const Text(
          'Cars',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          const Icon(Icons.notifications_outlined),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            icon: badges.Badge(
                showBadge: _counter != 0,
                position: const badges.BadgePosition(end: -12, bottom: 12),
                badgeContent: Text(
                  _counter.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_basket)),
            onPressed: () {},
          ),
          const SizedBox(
            width: 20,
          )
        ],
        centerTitle: false,
      ),
      body: body,
    );
  }

  Widget get body => Column(
        children: [
          SizedBox(
            height: 70,
            child: AnimationLimiter(
              child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: carColors!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemBuilder: (context, index) {
                    final carColor = carColors![index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        delay: const Duration(milliseconds: 100),
                        child: AspectRatio(
                          aspectRatio: 2 / 1,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              currentColor = carColor;
                              setState(() {});
                            },
                            child: Card(
                              elevation: .0,
                              margin: EdgeInsets.zero,
                              color: carColor.toLowerCase() ==
                                      currentColor!.toLowerCase()
                                  ? Colors.grey[300]
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                carColor,
                                style: const TextStyle(fontSize: 16),
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: cars.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 500),
                  position: index,
                  child: ScaleAnimation(
                    delay: const Duration(milliseconds: 200),
                    child: CarsWidget(
                        onPressed: () => selectFavourite(index),
                        car: cars[index]),
                  ),
                ),
              ),
            ),
          )
        ],
      );

  void selectFavourite(int? index) {
    if (cars[index!]!.favourite!) {
      _counter = _counter! - 1;
    } else {
      _counter = _counter! + 1;
    }
    cars[index]!.favourite = !cars[index]!.favourite!;

    setState(() {});
  }
}
