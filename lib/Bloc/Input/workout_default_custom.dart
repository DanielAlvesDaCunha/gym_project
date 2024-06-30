class CustomDefaultWorkout {
  String nome;
  String imagem;
  String detalhes;

  CustomDefaultWorkout({required this.nome, required this.imagem, required this.detalhes});

  Map<String, dynamic> toJson() {
    return {'nome': nome};
  }

  factory CustomDefaultWorkout.fromJson(Map<String, dynamic> json) {
    return CustomDefaultWorkout(nome: json['nome'], imagem: '', detalhes: '');
  }
}
