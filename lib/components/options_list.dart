import 'package:facebook_interface/components/button_img_profile.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OptionList extends StatelessWidget {
  const OptionList({Key? key, required this.user}) : super(key: key);

  final User user;

  final List<List> _options = const [
    [LineIcons.userFriends, ColorsPalette.azulFacebook, "Amigos"],
    [LineIcons.facebookMessenger, ColorsPalette.azulFacebook, "Mensagens"],
    [LineIcons.flag, Colors.orange, "Páginas"],
    [LineIcons.users, ColorsPalette.azulFacebook, "Grupos"],
    [Icons.storefront_outlined, ColorsPalette.azulFacebook, "Marketplace"],
    [Icons.ondemand_video, Colors.red, "Assistir"],
    [LineIcons.calendar, Colors.deepPurple, "Eventos"],
    [LineIcons.chevronCircleDown, Colors.black45, "Ver mais"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 1 + _options.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ButtonImageProfile(user: user, onTap: () {}),
              );
            }

            List item = _options.elementAt(index - 1);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Option(
                icon: item[0],
                color: item[1],
                text: item[2],
                onTap: () {},
              ),
            );
          }),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 35),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
