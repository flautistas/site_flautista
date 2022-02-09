import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static const _clienteIDWeb =
      '627728528887-gclkcvhqq6cua0d5uo58bhjb8u6mhap6.apps.googleusercontent.com';

  static final _googleSignIn = GoogleSignIn(clientId: _clienteIDWeb);

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() async {
    FirebaseAuth.instance.signOut();

    return _googleSignIn.disconnect();
  }
}
