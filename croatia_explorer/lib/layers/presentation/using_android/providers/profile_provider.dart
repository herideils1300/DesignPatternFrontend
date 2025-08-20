import 'dart:async';

import 'package:croatia_explorer/layers/domain/credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileProvider extends StateNotifier<List<User>>{
  ProfileProvider(super.state);
  StoredCredentials storedCredentials = StoredCredentials();
  UserCredential? _credential;
  FirebaseAuth auth = FirebaseAuth.instance;
  Object? error;

  void store(StoredCredentials creds){
    storedCredentials = creds;
  }

  void sendRecoveryMail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Object? getErrorIfPresent(){
    return (error != null) ? error : "";
  }

  Future<void> signOutCurrentUser() async {
    await auth.signOut();
    state.firstWhere((user) => auth.currentUser == user);
  }

  Future<void> signInUser() async {
    try{
      if(auth.currentUser == null) {
      _credential = await auth.signInWithEmailAndPassword(email: storedCredentials.email, password: storedCredentials.password);
      state.add(_credential!.user!);
    }else{
      state.add(auth.currentUser!);
    }
    }catch (e){
      error = e;
      rethrow;
    }
    
  }


}

final profileNotifier = StateNotifierProvider((ref) => ProfileProvider([]));