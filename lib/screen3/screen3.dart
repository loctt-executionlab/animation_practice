import 'package:animation_practice/screen3/data/provider.dart';
import 'package:animation_practice/screen3/tabs/tab_1.dart';
import 'package:animation_practice/screen3/tabs/tab_2.dart';
import 'package:animation_practice/screen3/widgets/animated_background.dart';
import 'package:animation_practice/screen3/widgets/tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// KEYNOTES:
// challenge: PageController has to be first attatched to obtain value (for animation)

class Screen3 extends HookConsumerWidget {
  const Screen3({super.key});

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          PageView(
            controller: ref.watch(pageControllerProvider),
            children: const [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Tab1(),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Tab2(),
              ),
            ],
          ),
          const TabIndicator(),
        ],
      ),
    );
  }
}
