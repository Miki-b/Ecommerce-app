import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository{
  final FirebaseAuth _auth;

  AuthRepository(this._auth);


  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() => _auth.authStateChanges();


  //sign in

  Future<UserCredential> signIn(String email ,  String password){
    return _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }


  // sign up
  Future<UserCredential> signUp(String email ,  String password){
    return _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }
  // sign out
  Future<void> signOut() {
    return _auth.signOut();
  }

}

final firebaseAuthProvider = Provider<FirebaseAuth> ((ref) {
  return FirebaseAuth.instance;
});

final authRepostioryProvider = Provider<AuthRepository> ((ref) {
  return AuthRepository(ref.read(firebaseAuthProvider));
});




