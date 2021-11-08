import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/img_profile.dart';
import 'package:facebook_interface/models/post.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:facebook_interface/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CabecalhoPost(post: post),
                  const SizedBox(height: 7),
                  Text(post.descricao),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                imageUrl: post.urlImagem,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: StaticsPost(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class StaticsPost extends StatefulWidget {
  const StaticsPost({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<StaticsPost> createState() => _StaticsPostState();
}

class _StaticsPostState extends State<StaticsPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: ColorsPalette.azulFacebook, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 13,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                "${widget.post.curtidas}",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              "${widget.post.comentarios} comentários",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "${widget.post.compartilhamentos} compartilhamentos",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            PostButton(
              icon: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              text: "Curtir",
              onTap: () => {
                setState(() {
                  widget.post.curtidas += 1;
                }),
              },
            ),
            PostButton(
              icon: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              text: "Comentar",
              onTap: () => {
                setState(() {
                  widget.post.comentarios += 1;
                }),
              },
            ),
            PostButton(
              icon: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              text: "Compartilhar",
              onTap: () => {
                setState(() {
                  widget.post.compartilhamentos += 1;
                }),
              },
            ),
          ],
        ),
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  final Icon icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CabecalhoPost extends StatelessWidget {
  const CabecalhoPost({Key? key, required this.post}) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageProfile(
          urlImage: post.urlImagem,
          visualized: true,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text("${post.tempoAtras} - "),
                  Icon(
                    Icons.public,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
