import 'package:animation_practice/screen3/circle_paint.dart';
import 'package:animation_practice/screen3/data/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedBackground extends ConsumerWidget {
  const AnimatedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final size = MediaQuery.of(context).size;
    final pageController = ref.watch(pageControllerProvider);
    return AnimatedBuilder(
      animation: pageController,
      builder: (_, __) {
        final aniDelay = size.width * 0.64;
        final offset = ref.watch(offsetProvider).offset;

        return Stack(
          children: [
            Transform.translate(
              offset: Offset(-offset * 2 - 36, 100),
              child: const RotatedBox(
                quarterTurns: 1,
                child: Text(
                  '72',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 400, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-offset * .8 + size.width * 1.3, 364),
              child: Circle(
                circleSize:
                    ((offset - aniDelay) / (size.width - aniDelay)) * 164,
              ),
            ),
            Transform.translate(
              offset: Offset(-offset * .8, 300),
              child: Stack(
                children: [
                  Transform.scale(
                      scale: 1.5,
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/leopard.png')),
                ],
              ),
            ),
            AnimatedBuilder(
                animation: pageController,
                builder: (_, __) {
                  return Transform.translate(
                    offset: Offset(-offset * .8 + size.width + 48, 192),
                    child: Transform.scale(
                        scale: 0.75,
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/vulture.png',
                        )),
                  );
                }),
          ],
        );
      },
    );
  }
}
