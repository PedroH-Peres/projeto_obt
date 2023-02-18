class AppUser{
  final String id;
  final String name;
  final String email;
  final String tipoConta;
  final String? bio;
  

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.tipoConta,
    this.bio
  });

}