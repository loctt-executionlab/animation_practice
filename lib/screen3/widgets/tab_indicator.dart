import 'package:animation_practice/screen3/data/provider.dart';
import 'package:animation_practice/screen3/tabs/tab_1.dart';
import 'package:animation_practice/screen3/tabs/tab_2.dart';
import 'package:animation_practice/screen3/widgets/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;

class TabIndicator extends ConsumerWidget {
  const TabIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(pageControllerProvider);
    return Transform.translate(
      offset: const Offset(0, -48),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, widget) {
                final currentPage = controller.page ?? 0;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Dot(
                      currentPage: currentPage,
                      page: 0,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _Dot(
                      currentPage: currentPage,
                      page: 1,
                    ),
                  ],
                );
              })),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.currentPage,
    required this.page,
  }) : super(key: key);

  final double currentPage;
  final int page;

  @override
  Widget build(BuildContext context) {
    final double opacity = (1 - currentPage - page).abs().clamp(0.2, 0.8);
    return Text(
      '\u25cf',
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(opacity),
      ),
    );
  }
}
