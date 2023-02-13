import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_obt/core/auth/auth_service.dart';
import 'package:projeto_obt/core/models/app_user.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthFirebaseService implements AuthService{
  static AppUser? _currentUser;
  static User? _currentAuthUser;
  static final _userStream = Stream<AppUser?>.multi((controller) async { 
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for(final user in authChanges){
      _currentUser = user == null ?null : _toAppUser(user);
      _currentAuthUser = user;
      controller.add(_currentUser);
    }
  });

  @override
  AppUser? get currentUser {
    return _currentUser;
  }

  User? get authUser{
    return _currentAuthUser;
  }


  @override
  Stream<AppUser?> get userChanges{
    return _userStream;
  }

  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup(String name, String email, String password, String tipoConta) async {
    final signup = await Firebase.initializeApp(
      name: 'userSignup',
      options: Firebase.app().options
    );

    final auth = FirebaseAuth.instanceFor(app: signup);

    UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);

    if(credential.user != null){
      await credential.user?.updateDisplayName(name);
      await login(email, password);
      _currentUser = _toAppUser(credential.user!, name, tipoConta);
    }

  }

  static AppUser _toAppUser(User user, [String? name, String? tipoConta]) {
    return AppUser(
      id: user.uid,
      name: name ?? user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      tipoConta: tipoConta ?? 'Aluno',
    );
  }
  


}