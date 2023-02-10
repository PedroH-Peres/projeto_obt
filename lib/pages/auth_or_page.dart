import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/pages/loading_page.dart';

import '../core/auth/auth_service.dart';
import '../core/models/app_user.dart';
import 'auth_page.dart';
import 'feed_page.dart';

class AuthOrPage extends StatelessWidget {
  const AuthOrPage({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingPage();
        }else{
          return StreamBuilder<AppUser?>(
              stream: AuthService().userChanges,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingPage();
                } else {

                  return snapshot.hasData ? FeedPage() : AuthPage();
                }
              }),
            );
        }
        
      }));
  }
}