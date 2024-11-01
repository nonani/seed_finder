import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/providers/auth_state_provider.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/widgets/cdn_image.dart';
import 'package:seed_finder/widgets/personal_list_tile.dart';

import '../providers/profile_provider.dart';

class PersonalProfileListTile extends ConsumerWidget {
  const PersonalProfileListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    // final url = profile.whenOrNull(
    //   data: (data) => data.profileImageUrl,
    // );

    final name = profile.maybeWhen(
      data: (data) => data.userName,
      orElse: () => "",
    );

    final email = profile.maybeWhen(
      data: (data) => data.userEmail,
      orElse: () => "",
    );

    final contact = profile.maybeWhen(
      data: (data) => data.userContact,
      orElse: () => "",
    );

    return PersonalListTile(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      leading: CdnImage.circle(
        null,
        dimension: 72,
        fallback: const Icon(Icons.person, size: 36),
      ),
      titleSpacing: 8,
      title:  Text(name, style: titleMedium),
      subtitle:  Text(email ?? contact ?? ""),
      //Icon(DearsIcons.pencil_simple, size: 24),
    );
  }
}
