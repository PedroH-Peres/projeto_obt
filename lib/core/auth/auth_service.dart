import 'package:projeto_obt/core/auth/auth_firebase_service.dart';

import '../models/app_user.dart';

abstract class AuthService {
  AppUser? get currentUser;

  Stream<AppUser?> get userChanges;

  Future<void> signup(
      String name, String email, String password, String tipoConta);

  Future<void> login(String email, String password);

  Future<void> logout();

  factory AuthService() {
    return AuthFirebaseService();
  }
}
