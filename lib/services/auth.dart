import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // makes this a singleton class
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInWithPhoneAuthCredential(verificationId, smsCode, callback) async {
    final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    late final UserCredential? authCredential;
    late final String errorMsg;
    try{
      authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      errorMsg = "";
    } on FirebaseAuthException catch (e){
      errorMsg = e.message as String;
      authCredential = null;
    }
    callback(authCredential, errorMsg);
  }

  Future<void> phoneSignIn(
      {required String phoneNumber,
        required Function verifiedCallback,
        required Function verifyFailedCallback,
        required Function codeSentCallback}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (authCredential) =>
            verifiedCallback(authCredential),
        verificationFailed: (exception) =>
            verifyFailedCallback(exception.message),
        codeSent: (verificationId, forceResendingToken) =>
            codeSentCallback(verificationId),
        codeAutoRetrievalTimeout: (String timeout) => null);
  }


  void signOut() async {
    await _auth.signOut();
  }

  Stream<User?> getUserStream(){
    return _auth.authStateChanges();
  }
}