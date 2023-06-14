import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'drawer_item.dart';

class SpecialDrawer extends StatelessWidget {
  const SpecialDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const ListTile(
            title: Text('s.khasanov_'),
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.archive.svg(),
              title: 'Archive',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.yourActivity.svg(),
              title: 'Your Activity',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.nameTag.svg(),
              title: 'Nametag',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.saved.svg(),
              title: 'Saved',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.closeFreinds.svg(),
              title: 'Close Friends',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.discoverPeople.svg(),
              title: 'Discover People',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.openFacebook.svg(),
              title: 'Open Facebook',
            ),
            onTap: () {},
          ),
          const Expanded(child: SizedBox()),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.setting.svg(),
              title: 'Settings',
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}