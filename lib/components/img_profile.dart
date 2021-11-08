import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  final String urlImage;
  final bool visualized;
  const ImageProfile(
      {Key? key, required this.urlImage, this.visualized = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: ColorsPalette.azulFacebook,
      child: CircleAvatar(
        radius: visualized ? 22 : 20,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
