import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Offset>? animation;
  Animation<Color?>? colorAnimation;
  Animation<double>? animation1;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    colorAnimation = ColorTween(begin: Colors.red, end: Colors.yellow)
        .animate(animationController!);

    animation1 =
        Tween<double>(begin: 100, end: 300).animate(animationController!);
    animationController!.repeat();
    //animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedBuilder(
            //   animation: animationController!.view,
            //   builder: (context, child) {
            //     return Transform.rotate(
            //       angle: animationController!.value * 2 * pi,
            //       child: FlutterLogo(
            //         size: 200,
            //       ),
            //     );
            //   },
            // ),
            AnimatedBuilder(
              animation: animationController!.view,
              builder: (context, child) {
                return Transform.scale(
                  scale: animationController!.value,
                  child: FlutterLogo(
                    size: 200,
                  ),
                );
              },
            ),
            // AnimatedBuilder(
            //   animation: animationController!.view,
            //   builder: (context, child) {
            //     return SlideTransition(
            //       position: animation!,
            //       child: FlutterLogo(
            //         size: 200,
            //       ),
            //     );
            //   },
            // ),

            // AnimatedBuilder(
            //   animation: animationController!.view,
            //   builder: (context, child) {
            //     return Container(
            //       height: 200,
            //       width: 200,
            //       color: colorAnimation!.value,
            //     );
            //   },
            // )
            AnimatedBuilder(
              animation: animationController!.view,
              builder: (context, child) {
                return Container(
                  height: animation1!.value,
                  width: animation1!.value,
                  color: Colors.red,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
