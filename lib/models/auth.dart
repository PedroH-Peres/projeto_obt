
enum AuthMode{Login , Signup}
class Auth {
  String name = '';
  String email = '';
  String password = '';
  String tipoConta = 'aluno';


  AuthMode _mode = AuthMode.Login;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSignup {
    return _mode == AuthMode.Signup;
  }

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.Signup : AuthMode.Login;
  }

}