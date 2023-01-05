import 'package:animation_practice/screen3/circle_paint.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// KEYNOTES:
// challenge: PageController has to be first attatched to obtain value (for animation)

final offsetProvider = ChangeNotifierProvider<OffsetNotifier>((ref) {
  return OffsetNotifier(ref.watch(pageControllerProvider));
});

final pageControllerProvider = Provider<PageController>((ref) {
  return PageController();
});

class OffsetNotifier extends ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  OffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page ?? 0;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

class Screen3 extends HookConsumerWidget {
  const Screen3({super.key});

  @override
  Widget build(context, ref) {
    final pageController = ref.watch(pageControllerProvider);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: pageController,
            builder: (_, __) {
              final aniDelay = size.width * 0.64;

              final offset = ref.watch(offsetProvider).offset;

              return Stack(
                children: [
                  Transform.translate(
                    offset: Offset(-offset * 2 - 36, 164),
                    child: const RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        '72',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 400, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-offset * .8 + size.width * 1.3, 400),
                    child: Circle(
                      circleSize:
                          ((offset - aniDelay) / (size.width - aniDelay)) * 164,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-offset * .8, 360),
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
                          offset: Offset(-offset * .8 + size.width + 48, 236),
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
          ),
          PageView(
            controller: pageController,
            children: [
              Builder(builder: (context) {
                return Container(
                  child: Center(child: Text('page 1')),
                );
              }),
              Container(
                child: Center(child: Text('page 2')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
