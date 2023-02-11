
enum AuthMode{Login , Signup}
class Auth {
  String name = '';
  String email = '';
  String password = '';
  String tipoConta = 'aluno';
  static bool firstTime = false;


  AuthMode _mode = AuthMode.Signup;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSignup {
    return _mode == AuthMode.Signup;
  }

  static bool get isFirstTime{
    return firstTime;
  }

  static void setFirstTime(){
    firstTime = true;
  }

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.Signup : AuthMode.Login;
  }

}