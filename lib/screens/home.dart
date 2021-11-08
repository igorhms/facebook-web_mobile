import 'package:facebook_interface/components/botao_circulo.dart';
import 'package:facebook_interface/components/card_post.dart';
import 'package:facebook_interface/components/contact_list.dart';
import 'package:facebook_interface/components/create_post.dart';
import 'package:facebook_interface/components/options_list.dart';
import 'package:facebook_interface/components/story.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:facebook_interface/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeMobile(scrollController: _scrollController),
          desktop: HomeDesktop(scrollController: _scrollController),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key, required this.scrollController})
      : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text(
            "facebook",
            style: TextStyle(
              color: ColorsPalette.azulFacebook,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
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
        SliverToBoxAdapter(
          child: CreatePost(
            usuario: loggedUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryArea(
              user: loggedUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Post currentPost = postagens.elementAt(index);
              return PostCard(
                post: currentPost,
              );
            },
            childCount: postagens.length,
          ),
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key, required this.scrollController})
      : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: OptionList(user: loggedUser),
          ),
          flex: 2,
        ),
        const Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: StoryArea(
                    user: loggedUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePost(
                  usuario: loggedUser,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Post currentPost = postagens.elementAt(index);
                    return PostCard(
                      post: currentPost,
                    );
                  },
                  childCount: postagens.length,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ContactList(users: onlineUsers),
          ),
          flex: 2,
        ),
      ],
    );
  }
}
