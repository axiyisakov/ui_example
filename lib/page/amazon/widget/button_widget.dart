import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SizedBox(
                width: double.infinity,
                child: Text('Sign in for best experience')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(.0),
                  onPressed: () {},
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: const Text('Create an account')),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
