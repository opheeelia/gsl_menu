import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // makes this a singleton class
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInWithPhoneAuthCredential(verificationId, smsCode, callback) async {
    // TODO: Step 5 - Use PhoneAuthProvider to get credential
    late final UserCredential? authCredential;
    late final String errorMsg;
    // TODO: Step 6 - Use credentials to sign in with _auth

    // TODO: uncomment when done
    // callback(authCredential, errorMsg);
  }

  Future<void> phoneSignIn(
      {required String phoneNumber,
        required Function verifiedCallback,
        required Function verifyFailedCallback,
        required Function codeSentCallback}) async {
    // TODO: Step 3 - use _auth.verifyPhoneNumber
  }


  void signOut() async {
    // TODO: Step 10
  }

  Stream<User?> getUserStream(){
    // TODO: Step 7
    throw Exception("User stream not implemented");
  }
}