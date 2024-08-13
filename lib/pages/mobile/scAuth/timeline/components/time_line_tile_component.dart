import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scAuth/timeline/components/event_card.dart';
import 'package:laborus_app/pages/mobile/scAuth/timeline/components/indicator_timeline.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineTileComponent extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final IconData icon;
  final int index;
  final String label;
  const TimeLineTileComponent({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.icon,
    required this.index,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        indicatorStyle: IndicatorStyle(
          color: Theme.of(context).colorScheme.tertiary,
          width: 50,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 8),
          indicator: indicatorTimeline(icon: icon),
        ),
        endChild: EventCard(
          index: index,
          label: label,
        ),
      ),
    );
  }
}
