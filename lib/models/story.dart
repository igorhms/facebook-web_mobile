import 'package:facebook_interface/models/models.dart';

class Story {
  User user;
  String urlImagem;
  bool visualized;

  Story({
    required this.user,
    required this.urlImagem,
    this.visualized = false,
  });
}
