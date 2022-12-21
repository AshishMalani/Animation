import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool large = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Animation",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 10),
              height: large ? 500 : 200,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      large = !large;
                    });
                  },
                  child: Image.asset('assets/images/1.png')),
            ),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       large = !large;
            //     });
            //   },
            //   child: Image.asset(
            //     'assets/images/1.png',
            //     height: 50,
            //     width: 50,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
