import 'package:animation_practice/screen3/circle_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;

class Screen3 extends HookWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = usePageController();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: scrollController,
            children: [
              Transform.translate(
                offset: const Offset(-36, 150),
                child: const RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    '72',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 400, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: scrollController,
                builder: (_, __) {
                  final aniDelay = size.width * 0.64;
                  return Center(
                    child: Transform.translate(
                      offset: const Offset(0, -64),
                      child: Circle(
                        circleSize: ((scrollController.offset - aniDelay) /
                                (size.width - aniDelay)) *
                            164,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          IgnorePointer(
            child: AnimatedBuilder(
                animation: scrollController,
                builder: (_, __) {
                  return Transform.translate(
                    offset: Offset(-scrollController.offset * .8, 360),
                    child: Transform.scale(
                        scale: 1.5,
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/leopard.png')),
                  );
                }),
          ),
          IgnorePointer(
            child: AnimatedBuilder(
                animation: scrollController,
                builder: (_, __) {
                  print(scrollController.offset);
                  return Transform.translate(
                    offset: Offset(
                        -scrollController.offset * .8 + size.width + 48, 236),
                    child: Transform.scale(
                        scale: 0.75,
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/vulture.png',
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
