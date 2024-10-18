import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:seed_finder/models/event.dart';
import 'package:seed_finder/widgets/favorite_toggle_button.dart';

class EventListTile extends StatelessWidget {
  final Event event;

  const EventListTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push("/details/${event.id}");
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  event.category,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                '마감일자 ${DateFormat("yy-MM-dd").format(event.endDate)}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  event.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FavoriteToggleButton(event.id),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
