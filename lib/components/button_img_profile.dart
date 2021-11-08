import 'package:facebook_interface/components/img_profile.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:flutter/material.dart';

class ButtonImageProfile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const ButtonImageProfile({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageProfile(urlImage: user.urlImagem, visualized: true),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              user.nome,
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
