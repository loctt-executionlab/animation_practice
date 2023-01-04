import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;

// 3d slider animation
// key takeaway:
// pay attention to perspective/ interaction between 2 animation,
//

class Screen1 extends HookWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 1000);
    final animationController = useAnimationController(duration: duration);
    Size screensize = MediaQuery.of(context).size;
    final slideValue = screensize.width * 0.7;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: Offset(slideValue * (animationController.value - 1), 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(math.pi / 2 * (1 - animationController.value)),
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: slideValue,
                    color: Colors.green[100],
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: Offset(slideValue * animationController.value, 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-math.pi * animationController.value / 2),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.blue[100],
                  ),
                ),
              );
            },
          ),
          SafeArea(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      Text('adsfasdfasdfasdfsd'),
                      Text('adsfasdfasdfasdfsd'),
                      Text('adsfasdfasdfasdfsd'),
                      Text('adsfasdfasdfasdfsd'),
                      Text('adsfasdfasdfasdfsd'),
                      Text('adsfasdfasdfasdfsd'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () {
              (animationController.value == 0)
                  ? animationController.forward()
                  : animationController.reverse();
            },
            child: const Text('play'),
          ),
          TextButton(
            onPressed: () {
              (animationController.value == 0)
                  ? animationController.forward()
                  : animationController.reverse();
            },
            child: const Text('to menu'),
          ),
        ],
      ),
    );
  }
}
