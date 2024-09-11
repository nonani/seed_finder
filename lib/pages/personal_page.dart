import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/theme.dart';
import '../widgets/personal_list_tile.dart';
import '../widgets/personal_profile_list_tile.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text("마이페이지"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PersonalProfileListTile(),
          const Divider(
            height: 4,
            thickness: 4,
            color: gray100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13, top: 16, bottom: 10),
            child: Text(
              "내 활동",
              style: TextStyle(
                color: gray600,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //TODO: PersonalListTile 수정
          PersonalListTile(
            onTap: () {},
            title: const Text("기능 1"),
            leading: const Icon(Icons.account_balance_rounded),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13, top: 20, bottom: 10),
            child: Text(
              "고객센터",
              style: TextStyle(
                color: gray600,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PersonalListTile(
            onTap: () {},
            title: const Text("기능 2"),
            leading: const Icon(Icons.account_balance_rounded),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
