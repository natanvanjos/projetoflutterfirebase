class usuario {
  String id;
  String nome;
  int idade;

  usuario({this.id = '', required this.nome, required this.idade});

//___________________________________________________________
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,


    };
  }

//____________________________________________________________
  factory usuario.fromJson(Map<String, dynamic> json){
    return usuario (id: json['id'], nome: json['nome'], idade: json['idade']);
  }
}