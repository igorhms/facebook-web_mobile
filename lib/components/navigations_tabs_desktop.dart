import 'package:facebook_interface/components/button_img_profile.dart';
import 'package:facebook_interface/components/navigations_tabs.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'botao_circulo.dart';

class NavigationTabsDesktop extends StatelessWidget {
  final User user;
  final List<IconData> icons;
  final int indexSelectedTab;
  final Function(int) onTap;

  const NavigationTabsDesktop({
    Key? key,
    required this.icons,
    required this.indexSelectedTab,
    required this.onTap,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: ColorsPalette.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Expanded(
            child: NavigationTabs(
              icons: icons,
              indexSelectedTab: indexSelectedTab,
              onTap: onTap,
              downIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonImageProfile(
                  onTap: () {},
                  user: user,
                ),
                const SizedBox(width: 5),
                BotaoCirculo(
                  icone: Icons.search,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
                BotaoCirculo(
                  icone: LineIcons.facebookMessenger,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
