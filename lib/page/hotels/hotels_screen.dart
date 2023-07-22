import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lesson_g/model/hotel_model.dart';
/*
Created by Axmadjon Isaqov on 10:01:57 23.09.2022
© 2022 @axi_dev 
*/

/*
Mavzu::: 6-mavzu
*/
class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final List<Hotel> _list = [
    const Hotel(image: 'assets/images_5/ic_hotel1.jpg', title: 'Hotel'),
    const Hotel(image: 'assets/images_5/ic_hotel2.jpg', title: 'Hotel'),
    const Hotel(image: 'assets/images_5/ic_hotel3.jpg', title: 'Hotel'),
    const Hotel(image: 'assets/images_5/ic_hotel4.jpg', title: 'Hotel'),
    const Hotel(image: 'assets/images_5/ic_hotel5.jpg', title: 'Hotel'),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            backgroundColor: Colors.white,
            floating: false,
            elevation: .0,
            pinned: true,
            // snap: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: CupertinoTextField(
                      placeholder: 'Search for hotels...',
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      placeholderStyle:
                          const TextStyle(fontSize: 14, color: Colors.grey),
                      prefix: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.search,
                          size: 20,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                ],
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images_5/ic_header.jpg',
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.55),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          'What kind of hotel do you need?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Best Hotels',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'show all',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 170,
              child: AnimationLimiter(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: _list.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Hotel hotel = _list[index];
                      return AnimationConfiguration.staggeredList(
                        duration: const Duration(seconds: 1),
                        position: index,
                        child: ScaleAnimation(
                          delay: const Duration(milliseconds: 200),
                          child: AspectRatio(
                            aspectRatio: 2.1 / 1.4,
                            child: Card(
                              color: Colors.transparent,
                              margin: EdgeInsets.zero,
                              elevation: .0,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                alignment: FractionalOffset.bottomLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(hotel.image),
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.3),
                                            BlendMode.darken),
                                        fit: BoxFit.cover)),
                                child: Text(
                                  '${hotel.title} ${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Luxury Hotels',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'show all',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 170,
              child: AnimationLimiter(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: _list.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Hotel hotel = _list.reversed.toList()[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 1),
                        child: ScaleAnimation(
                          delay: const Duration(milliseconds: 200),
                          child: AspectRatio(
                            aspectRatio: 2.1 / 1.4,
                            child: Card(
                              color: Colors.transparent,
                              margin: EdgeInsets.zero,
                              elevation: .0,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                alignment: FractionalOffset.bottomLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(hotel.image),
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.3),
                                            BlendMode.darken),
                                        fit: BoxFit.cover)),
                                child: Text(
                                  "${hotel.title} ${index + 1}",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => Card(
              color: Colors.red,
              child: ListTile(
                title: Text('Title $index'),
              ),
            ),
            childCount: 20,
          )),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  color: Colors.green,
                  child: ListTile(
                    title: Text('Title $index'),
                  ),
                ),
                childCount: 20,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3)),
          const SliverFillRemaining(),
        ],
      ),
    );
  }
}
