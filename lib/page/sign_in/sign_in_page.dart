import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  late AnimationController? _animationController;
  late AnimationController? _animationControllerOne;
  late ColorTween? _colorTween;
  late Animation<Color?>? _animation;
  late Tween<Offset?> _offset;
  late Animation<Offset?> _animationOffset;
  late Animation<double> _animationFade;
  late MediaQueryData? _mediaQueryData;

  @override
  void initState() {
    _animationControllerOne =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _colorTween = ColorTween(begin: Colors.green, end: Colors.red);
    _animation = _colorTween!.animate(CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(.1, .8, curve: Curves.easeIn)));
    _animationController!
        .repeat(reverse: true, period: const Duration(seconds: 3));

    _offset = Tween(begin: const Offset(0, -200), end: const Offset(0, 0));
    _animationOffset = _offset.animate(CurvedAnimation(
        parent: _animationControllerOne!, curve: Curves.easeIn));

    _animationFade = Tween(begin: .0, end: 1.0).animate(CurvedAnimation(
        parent: _animationControllerOne!,
        curve: const Interval(.8, 1, curve: Curves.easeIn)));
    _animationControllerOne!.forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _mediaQueryData = MediaQuery.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _animationControllerOne!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: 'chat'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: 'chat'),
        ],
      ),
      tabBuilder: (context, index) => Material(
        child: Stack(
          children: [_backgroundWidget, _foregroundWidget],
        ),
      ),
    );
  }

  Widget get _foregroundWidget {
    return RepaintBoundary(
      child: Column(
        children: [
          Container(
            height: _mediaQueryData!.size.height * 0.22,
            width: _mediaQueryData!.size.width,
            padding: const EdgeInsets.only(left: 20),
            transform: Matrix4.translationValues(0, 28, 0),
            decoration: const BoxDecoration(color: Colors.transparent),
            alignment: Alignment.centerLeft,
            child: AnimatedBuilder(
                animation: _animationOffset,
                builder: (context, _) {
                  return Transform.translate(
                    offset: _animationOffset.value!,
                    child: FadeTransition(
                      opacity: _animationFade,
                      child: const Text.rich(
                        TextSpan(text: 'Login\n', children: [
                          TextSpan(
                            text: 'Welcome Back',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        ]),
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
            child: ColoredBox(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: _mediaQueryData!.size.height * 0.1,
                        left: _mediaQueryData!.size.width * 0.1,
                        right: _mediaQueryData!.size.width * 0.1),
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          children: [
                            _myTextField(hintText: 'Email', obscure: false),
                            const Divider(
                              thickness: .5,
                              color: Colors.black,
                            ),
                            _myTextField(hintText: 'Password', obscure: true)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQueryData!.size.height * .04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _mediaQueryData!.size.width * 0.2),
                    child: SizedBox(
                      width: double.infinity,
                      child: _button(
                          text: 'Login',
                          onPressed: () {},
                          color: const Color(0xFF2E7D31)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text('Login with SNS'),
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 10,
                        child: _button(
                            text: 'Facebook',
                            onPressed: () {},
                            color: Colors.blue),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 10,
                        child: _button(
                            text: 'Github',
                            onPressed: () {},
                            color: Colors.black),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget get _backgroundWidget {
    const Color baseColor = Color(0xFF1B5E20);
    return AnimatedBuilder(
        animation: _animation!,
        builder: (context, _) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: _animation!.value!,
              // gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [
              //       baseColor,
              //       baseColor.withOpacity(.9),
              //       baseColor.withOpacity(0.8),
              //       baseColor.withOpacity(0.7),
              //       baseColor.withOpacity(0.6),
              //       baseColor.withOpacity(0.5),
              //       baseColor.withOpacity(0.4),
              //       baseColor.withOpacity(0.3),
              //     ]),
            ),
            position: DecorationPosition.foreground,
            child: SizedBox(
              height: _mediaQueryData!.size.height,
              width: _mediaQueryData!.size.width,
            ),
          );
        });
  }

  TextField _myTextField({required String? hintText, required bool? obscure}) {
    return TextField(
      obscureText: obscure!,
      decoration: InputDecoration(
          hintText: hintText!,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }

  Widget _button(
      {required String? text,
      required VoidCallback? onPressed,
      required Color color}) {
    return CupertinoButton(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        color: color,
        borderRadius: BorderRadius.circular(30),
        onPressed: onPressed,
        child: Text(text!));
  }
}
