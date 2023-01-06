import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:animation_practice/screen4/utils/date_utils.dart';
import 'package:intl/intl.dart';
// animated time picker

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(
              height: 36,
              child: MonthSelector(),
            ),
            SizedBox(
              height: 64,
              child: DaySelector(),
            )
          ],
        ),
      ),
    );
  }
}

class MonthSelector extends HookWidget {
  const MonthSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const initialPage = 25;
    const totalPage = 49;

    final month = DateTime.now().month;

    final pageController = usePageController(initialPage: initialPage);

    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        Expanded(
            child: PageView.builder(
          controller: pageController,
          itemCount: totalPage,
          itemBuilder: ((context, index) {
            // somewhat hacky
            // workaround for the case when month is 12, then return value will be 0
            final currentMonth = (month + index - 2) % 12 + 1;
            return Center(
                child: Text(DateUtil.getMonthStrFromInt(currentMonth)));
          }),
        )),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
      ],
    );
  }
}

class DaySelector extends HookWidget {
  const DaySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();

    final dates = DateUtil.getDatesOfMonth(dateTime);

    final controller = useScrollController();

    return Row(
      children: [
        Expanded(child: LayoutBuilder(builder: (context, constraints) {
          final size = constraints.maxWidth;
          return ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: ((context, index) {
              return SizedBox(
                width: size / 7,
                child: Column(
                  children: [
                    Text(DateFormat('EEE').format(dates[index])),
                    Text(dates[index].day.toString()),
                  ],
                ),
              );
            }),
          );
        })),
      ],
    );
  }
}
