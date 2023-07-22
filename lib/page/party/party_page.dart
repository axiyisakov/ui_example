import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
Created by Axmadjon Isaqov on 10:01:35 23.09.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::7-mavzu
*/
class PartyPage extends StatefulWidget {
  const PartyPage({super.key});

  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage>
    with SingleTickerProviderStateMixin {
  late MediaQueryData _queryData;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animationLocation;
  late Animation<double> _animationButtonLocation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _queryData = MediaQuery.of(context);
    _animation = Tween<double>(begin: .0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationLocation = Tween<double>(begin: 100.0, end: 260.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationButtonLocation = Tween<double>(begin: -100, end: 20).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    _animationController.forward();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }

  Widget get body {
    return Stack(
      fit: StackFit.expand,
      children: [
        backgroundWidget,
        foregroundWidget,
        AnimatedBuilder(
            animation: _animationLocation,
            builder: (context, _) {
              return Positioned(
                  bottom: _animationLocation.value,
                  left: 20,
                  right: .0,
                  child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, _) {
                        return Opacity(
                          opacity: _animation.value,
                          child: RichText(
                            text: const TextSpan(
                                text: 'Find the best parties near you\n',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Let us find you a party for your interest',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w200,
                                        height: 3),
                                  )
                                ]),
                          ),
                        );
                      }));
            }),
        AnimatedBuilder(
            animation: _animationButtonLocation,
            builder: (context, _) {
              return Positioned(
                  bottom: _animationButtonLocation.value,
                  left: 20,
                  right: 20,
                  child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, _) {
                        return Opacity(
                          opacity: _animation.value,
                          child: CupertinoButton(
                            onPressed: () {},
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange,
                            child: const Text('Start'),
                          ),
                        );
                      }));
            })
      ],
    );
  }

  Widget get foregroundWidget => ShaderMask(
        blendMode: BlendMode.srcOver,
        shaderCallback: (bound) => LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.1),
            ]).createShader(bound),
        child: Container(
          height: _queryData.size.height,
          width: _queryData.size.width,
          color: Colors.black.withOpacity(0.1),
        ),
      );
  Widget get backgroundWidget => SizedBox(
        height: _queryData.size.height,
        width: _queryData.size.width,
        child: Image.asset(
          'assets/images/im_party.jpeg',
          fit: BoxFit.cover,
        ),
      );
}
