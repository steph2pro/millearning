
import 'package:firebase_auth/firebase_auth.dart';
void authWithPhoneNumber(
  String? phone,
  {
    required Function(String value,int? value1) onCodeSend,
    required Function(PhoneAuthCredential value) onAutoVerify,
    required Function(FirebaseAuthException value) onFailed,
    required Function(String value) autoRetrieval
  }
)async {
  final _auth =FirebaseAuth.instance;
  _auth.verifyPhoneNumber(
    phoneNumber: phone,
    verificationCompleted: onAutoVerify, 
    verificationFailed: onFailed, 
    codeSent: onCodeSend, 
    codeAutoRetrievalTimeout: autoRetrieval
    );
}