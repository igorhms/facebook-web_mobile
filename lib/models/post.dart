import 'package:facebook_interface/models/models.dart';

class Post {
  User usuario;
  String descricao;
  String tempoAtras;
  String urlImagem;
  int curtidas;
  int comentarios;
  int compartilhamentos;

  Post({
    required this.usuario,
    required this.descricao,
    required this.tempoAtras,
    required this.urlImagem,
    required this.curtidas,
    required this.comentarios,
    required this.compartilhamentos,
  });
}
