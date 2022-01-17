import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // makes this a singleton class
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  // TODO: Step 0 - use FirebaseAuth

  signInWithPhoneAuthCredential(verificationId, smsCode, callback) async {
    // TODO: Step 9 - Use PhoneAuthProvider to get credential
    late final UserCredential? authCredential;
    late final String errorMsg;
    // TODO: Use credentials to sign in with _auth

    // TODO: uncomment when done
    // callback(authCredential, errorMsg);
  }

  Future<void> phoneSignIn(
      {required String phoneNumber,
        required Function verifiedCallback,
        required Function verifyFailedCallback,
        required Function codeSentCallback}) async {
    // TODO: Step 7 - use _auth.verifyPhoneNumber
  }


  void signOut() async {
    // TODO: Step 10
  }

  Stream<User?> getUserStream(){
    // TODO: Step 2
    throw Exception("User stream not implemented");
  }
}