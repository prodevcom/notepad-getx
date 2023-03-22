import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBarWidget({
    super.key,
    required this.title,
    this.signOut,
  });

  final String title;
  final void Function()? signOut;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: signOut,
          icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
