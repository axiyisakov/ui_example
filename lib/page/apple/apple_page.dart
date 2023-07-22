import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lesson_g/model/product_model.dart';

/*
Created by Axmadjon Isaqov on 09:20:40 16.09.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::Apple Products UI Design
*/
class ApplePage extends StatefulWidget {
  const ApplePage({super.key});

  @override
  State<ApplePage> createState() => _ApplePageState();
}

class _ApplePageState extends State<ApplePage> {
  int _counter = 0;
  final List<Product> _favouriteProductsList = [];
  @override
  void initState() {
    _favouriteProductsList.addAll([
      Product(image: 'assets/images/image_1.jpeg', isFavourite: false),
      Product(image: 'assets/images/image_2.jpg', isFavourite: false),
      Product(image: 'assets/images/image_4.jpg', isFavourite: false),
      Product(image: 'assets/images/image_5.jpg', isFavourite: false),
      Product(image: 'assets/images/image_1.jpeg', isFavourite: false),
      Product(image: 'assets/images/image_2.jpg', isFavourite: false),
      Product(image: 'assets/images/image_4.jpg', isFavourite: false),
      Product(image: 'assets/images/image_5.jpg', isFavourite: false),
      Product(image: 'assets/images/image_1.jpeg', isFavourite: false),
      Product(image: 'assets/images/image_2.jpg', isFavourite: false),
      Product(image: 'assets/images/image_4.jpg', isFavourite: false),
      Product(image: 'assets/images/image_5.jpg', isFavourite: false),
      Product(image: 'assets/images/image_1.jpeg', isFavourite: false),
      Product(image: 'assets/images/image_2.jpg', isFavourite: false),
      Product(image: 'assets/images/image_4.jpg', isFavourite: false),
      Product(image: 'assets/images/image_5.jpg', isFavourite: false),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.minWidth < 600) {
        return mobileView;
      } else {
        return Row(
          children: [
            Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                        color: Colors.white,
                        alignment: FractionalOffset.center,
                        child: const Text(
                          'Drawer',
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(child: mobileView)
          ],
        );
      }
    });
  }

  Widget get mobileView => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text('Apple Products'),
          elevation: .0,
          bottomOpacity: .0,
          actions: [counterWidget],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    color: Colors.white,
                    alignment: FractionalOffset.center,
                    child: const Text(
                      'Drawer',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          ),
        ),
        body: SizedBox(child: body),
      );

  Widget get body => SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //? Card Widget
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Container(
                height: 220,
                padding: const EdgeInsets.only(bottom: 20),
                alignment: FractionalOffset.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/image_3.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lifestyle Sale',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Shop now',
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //? Products
            AnimationLimiter(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _favouriteProductsList.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredGrid(
                  columnCount: 2,
                  duration: const Duration(milliseconds: 400),
                  position: index,
                  child: ScaleAnimation(
                    child: _productWidget(
                        image: _favouriteProductsList[index].image,
                        index: index,
                        isSelected: _favouriteProductsList[index].isFavourite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));

  Widget _productWidget(
      {required String? image, required bool? isSelected, required int index}) {
    return InkWell(
      onTap: () {
        if (_favouriteProductsList[index].favourite) {
          _counter--;
        } else {
          _counter++;
        }
        _favouriteProductsList[index].favourite =
            !_favouriteProductsList[index].favourite;

        setState(() {});
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(fit: StackFit.expand, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                )),
            Positioned(
                bottom: 10,
                right: 10,
                child: Icon(
                  isSelected! ? Icons.star : Icons.star_border,
                  size: 40,
                  color: Colors.yellow,
                ))
          ])),
    );
  }

  Widget get counterWidget => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          color: const Color(0xFF424242),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                _counter.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
}
