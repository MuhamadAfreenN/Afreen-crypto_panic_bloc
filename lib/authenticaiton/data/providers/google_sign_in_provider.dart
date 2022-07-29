import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

///Enable us to sign in with google

class GoogleSignInProvider {
  final GoogleSignIn _googleSignIn;
  GoogleSignInProvider({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;


  /// uses google sign in package ,create a google sign in  account and sign in  using authentication
  Future<AuthCredential> login() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    /// generate auth credentials using google auth provider
    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return authCredential;
  }
/// logout user from google
  Future<void> logout() async {
    if (await _googleSignIn.isSignedIn()) {
      _googleSignIn.signOut();
    }
  }
}
