import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/img_profile.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:facebook_interface/utils/responsive.dart';
import 'package:flutter/material.dart';

class StoryArea extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const StoryArea({
    Key? key,
    required this.user,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            Story storyUser =
                Story(user: loggedUser, urlImagem: loggedUser.urlImagem);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                story: storyUser,
                addStory: true,
              ),
            );
          }

          Story currentStory = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StoryCard(story: currentStory),
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  final bool addStory;

  const StoryCard({
    Key? key,
    required this.story,
    this.addStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: ColorsPalette.gradientStory,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: ColorsPalette.azulFacebook,
                    onPressed: () {},
                  ),
                )
              : ImageProfile(
                  urlImage: story.user.urlImagem,
                  visualized: story.visualized,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            addStory ? "Criar Story" : story.user.nome,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
