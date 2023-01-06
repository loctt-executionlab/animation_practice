import 'package:animation_practice/screen3/data/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tab2 extends ConsumerWidget {
  const Tab2({
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
          final baseOffset = size.width;
          final offsetFraction = 1 -
              ((baseOffset - pageController.offset) / baseOffset * scaleFactor);
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
              SizedBox(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Start camp',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(opacity)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '02:40 pm',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(opacity * .6)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: opacity * 60 + 50,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Base camp',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(opacity)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '07:30 am',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(opacity * .6)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          );
        });
  }
}
