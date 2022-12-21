import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Offset>? animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(animationController!);
    animationController!.repeat();
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
            //       angle: animationController!.value  2  pi,
            //       child: ContainerDemo(),
            //     );
            //   },
            // ),
            AnimatedBuilder(
              animation: animationController!.view,
              builder: (context, child) {
                return SlideTransition(
                  position: animation!,
                  child: Transform.rotate(
                      angle: animationController!.value * 2 * pi,
                      child: ContainerDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2-QRJouxxYMv_NoMXSLkKR6OXbz2oxwKEGQ&usqp=CAU'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
