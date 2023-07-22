import 'package:flutter/material.dart';
import 'package:lesson_g/model/car_model.dart';

class CarsWidget extends StatelessWidget {
  const CarsWidget({Key? key, required this.car, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  final CarModel? car;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(car!.image))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.2)
                  ]),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '${car!.name}\n',
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            height: 1.3),
                        children: [
                          TextSpan(
                            text: car!.fuel,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: FloatingActionButton(
                        heroTag: car!.name,
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        mini: true,
                        child: Icon(
                          car!.favourite!
                              ? Icons.favorite_outlined
                              : Icons.favorite_outline,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  car!.price,
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
