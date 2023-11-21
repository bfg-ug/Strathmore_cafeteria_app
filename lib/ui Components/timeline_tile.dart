import 'package:STC/global.dart';
import 'package:STC/ui%20Components/eventCard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class myTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final child;

  const myTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.child});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        //Decoration
        beforeLineStyle: LineStyle(
            color: isPast ? appcolors.orangeAccent : const Color(0xfffaa552),
            thickness: 10),

        indicatorStyle: IndicatorStyle(
            width: 60,
            color: isPast ? appcolors.orangeAccent : const Color(0xfff5a552),
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: isPast ? Colors.white : const Color(0xfff5a552),
                fontSize: 50)),

        endChild: eventCard(
          isPast: isPast,
          child: child,
        ),
      ),
    );
  }
}
