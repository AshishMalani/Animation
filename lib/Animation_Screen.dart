import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double oldHeight = 100;
  double oldWidth = 100;
  Color color = Colors.red;
  double oldRadius = 20;
  BoxShape boxShape = BoxShape.rectangle;
  double positioned = -20;
  double padding = 20;
  double opacity = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer(
            //   duration: Duration(seconds: 2),
            //   curve: Curves.easeInCirc,
            //   height: oldHeight,
            //   width: oldWidth,
            //   decoration: BoxDecoration(color: color, shape: boxShape),
            // ),
            // AnimatedPadding(
            //   padding: EdgeInsets.only(left: padding),
            //   duration: Duration(seconds: 2),
            //   child: Row(
            //     children: [
            //       FlutterLogo(
            //         size: 200,
            //       ),
            //     ],
            //   ),
            // ),
            // Stack(
            //   clipBehavior: Clip.none,
            //   children: [
            //     Container(
            //       height: 150,
            //       width: 150,
            //       color: Colors.green,
            //     ),
            //     AnimatedPositioned(
            //       duration: Duration(seconds: 2),
            //       right: positioned,
            //       top: positioned,
            //       child: Container(
            //         height: 150,
            //         width: 150,
            //         color: Colors.yellow,
            //       ),
            //     ),
            //   ],
            // ),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 3),
              child: FlutterLogo(
                size: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    oldHeight = oldHeight == 100 ? 200 : 100;
                    oldWidth = oldWidth == 100 ? 300 : 100;
                    color = color == Colors.red ? Colors.yellow : Colors.red;
                    boxShape = BoxShape.circle;
                    padding = padding == 20 ? 150 : 20;
                    opacity = opacity == 0.2 ? 0.8 : 0.2;
                    positioned = positioned == -20 ? -80 : -20;
                    // oldRadius = 100;
                  });
                },
                child: Text("Tap to Change"))
          ],
        ),
      ),
    );
  }
}