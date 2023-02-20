class AppUser{
  final String id;
  final String name;
  final String email;
  final String tipoConta;
  final String? bio;
  final String? info;
  final String? profissao;
  

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.tipoConta,
    this.info,
    this.profissao,
    this.bio
  });

}