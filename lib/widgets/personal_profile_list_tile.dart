import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/providers/user_info_provider.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/widgets/cdn_image.dart';
import 'package:seed_finder/widgets/personal_list_tile.dart';

class PersonalProfileListTile extends ConsumerWidget {
  const PersonalProfileListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final profile = ref.watch(profileProvider);

    // final url = profile.whenOrNull(
    //   data: (data) => data.profileImageUrl,
    // );
    //
    // final name = profile.maybeWhen(
    //   data: (data) => data.name,
    //   orElse: () => "",
    // );
    //
    // final email = profile.maybeWhen(
    //   data: (data) => data.email,
    //   orElse: () => "",
    // );

    const url =
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    const name = "John Doe";
    const email = "date.email";

    return PersonalListTile(
      onTap: () => ref.read(userInfoProvider.notifier).logout(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      leading: CdnImage.circle(
        url,
        dimension: 72,
        fallback: const Icon(Icons.person, size: 36),
      ),
      titleSpacing: 8,
      title: const Text(name, style: titleMedium),
      subtitle: const Text(email),
      trailing: const Icon(Icons.chevron_right, size: 24),
      //Icon(DearsIcons.pencil_simple, size: 24),
    );
  }
}
