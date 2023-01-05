import 'package:animation_practice/screen3/data/provider.dart';
import 'package:animation_practice/screen3/data/static.dart';
import 'package:animation_practice/screen3/widgets/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// KEYNOTES:
// challenge: PageController has to be first attatched to obtain value (for animation)

class Screen3 extends HookConsumerWidget {
  const Screen3({super.key});

  @override
  Widget build(context, ref) {
    final pageController = ref.watch(pageControllerProvider);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          PageView(
            controller: pageController,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: AnimatedBuilder(
                    animation: pageController,
                    builder: (context, widget) {
                      const scaleFactor = 2; // this indicate speed
                      final offsetFraction = 1 -
                          (pageController.offset * scaleFactor / size.width);
                      final double opacity = offsetFraction.clamp(0, 1);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            'Travel description',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(opacity)),
                            textScaleFactor: 2.0,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            leopardContent,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(opacity * 0.75)),
                          ),
                          const SizedBox(height: 36),
                        ],
                      );
                    }),
              ),
              Container(
                child: Center(child: Text('page 2')),
              ),
              Container(
                child: Center(child: Text('page 3')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
