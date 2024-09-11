import 'package:flutter/material.dart';

import 'package:seed_finder/utils/theme.dart';

class EmptyListWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  const EmptyListWidget({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;

    final child = subtitle == null
        ? Text(title, style: titleMedium)
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: titleMedium),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: bodySmall.copyWith(color: gray600),
              ),
            ],
          );

    return Expanded(
      child: Align(
        alignment: const Alignment(0, -0.5),
        child: child,
      ),
    );
  }
}

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Align(
        alignment: Alignment(0, -0.5),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
