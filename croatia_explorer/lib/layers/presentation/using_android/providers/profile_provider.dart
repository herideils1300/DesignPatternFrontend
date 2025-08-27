import 'dart:async';

import 'package:croatia_explorer/layers/domain/credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/user.dart' as TempUser;

class ProfileProvider extends StateNotifier<List<User>> {
  ProfileProvider(super.state);
  StoredCredentials storedCredentials = StoredCredentials();
  UserCredential? _credential;
  FirebaseAuth auth = FirebaseAuth.instance;
  Object? error;

  Future<String> addUser(TempUser.User user) async {
    UserCredential cred = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    return cred.user!.email!;
  }

  void store(StoredCredentials creds) {
    storedCredentials = creds;
  }

  Future<void> sendConfirmationMail(String email) async {
    await auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings:
            ActionCodeSettings(url: "/home", handleCodeInApp: true));
  }

  Future<void> sendRecoveryMail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Object? getErrorIfPresent() {
    return (error != null) ? error : "";
  }

  Future<void> deactivateUser() async {
    var user = await auth.userChanges().first;
    if (user != null) {
      user.delete();
    }
  }

  Future<void> signOutCurrentUser() async {
    await auth.signOut();
  }

  Future<void> signInUser() async {
    try {
      if (auth.currentUser == null) {
        _credential = await auth.signInWithEmailAndPassword(
            email: storedCredentials.email,
            password: storedCredentials.password);
        state.add(_credential!.user!);
      } else {
        state.add(auth.currentUser!);
      }
    } catch (e) {
      error = e;
      rethrow;
    }
  }
}

final profileNotifier = StateNotifierProvider<ProfileProvider, List<User>>(
    (ref) => ProfileProvider([]));
