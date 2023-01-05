import 'package:animation_practice/screen3/data/provider.dart';
import 'package:animation_practice/screen3/data/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tab1 extends ConsumerWidget {
  const Tab1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final pageController = ref.watch(pageControllerProvider);
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, widget) {
          const scaleFactor = 2; // this indicate speed
          final offsetFraction =
              1 - (pageController.offset * scaleFactor / size.width);
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
              const SizedBox(height: 100),
            ],
          );
        });
  }
}
