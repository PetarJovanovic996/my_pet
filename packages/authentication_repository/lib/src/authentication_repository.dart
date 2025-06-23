import 'dart:async';

import 'package:authentication_repository/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';

class RegisterWithEmailAndPasswordFailure implements Exception {
  const RegisterWithEmailAndPasswordFailure([
    this.message = 'Please check and update your data',
  ]);

  factory RegisterWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const RegisterWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'email-already-in-use':
        return const RegisterWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      default:
        return const RegisterWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([this.message = 'Failed to Log In']);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([this.message = 'Google Sign-In Failed']);
  final String message;
}

class LogOutFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({firebase_auth.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance {
    initPreferences();
  }

  final firebase_auth.FirebaseAuth _firebaseAuth;

  SharedPreferences? _prefs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _saveUserToCache(user);
      return user;
    });
  }

  Future<void> _saveUserToCache(User user) async {
    if (_prefs == null) {
      await initPreferences();
    }
    await _prefs?.setString('user_id', user.id);
    await _prefs?.setString('user_email', user.email ?? '');
    await _prefs?.setString('user_name', user.name ?? '');
  }

  User get currentUser {
    final userId = _prefs?.getString('user_id') ?? '';
    final userEmail = _prefs?.getString('user_email') ?? '';
    final userName = _prefs?.getString('user_name') ?? '';

    return User(id: userId, email: userEmail, name: userName);
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseAuth.currentUser?.updateDisplayName(name);
      // TODO: implementirati da se cuva i username nekako
      await _firebaseAuth.signOut();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw RegisterWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const RegisterWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const LogInWithGoogleFailure('Sign-in aborted by user.');
      }

      final googleAuth = await googleUser.authentication;

      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw const LogInWithGoogleFailure('Missing firebase user');
      }

      final user = firebaseUser.toUser;
      await _saveUserToCache(user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure(e.message ?? 'Unknown error');
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      await _prefs?.clear();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName);
  }
}

class DeleteAccountFailure implements Exception {
  const DeleteAccountFailure([this.message = 'Account deletion failed']);

  final String message;
}

extension AuthenticationRepositoryExtension on AuthenticationRepository {
  Future<void> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.delete();
        await _prefs?.clear();
      } else {
        throw const DeleteAccountFailure('No user currently signed in.');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw const DeleteAccountFailure(
          'Please log in again before deleting your account.',
        );
      }
      throw DeleteAccountFailure(e.message ?? 'Unknown error');
    } catch (_) {
      throw const DeleteAccountFailure();
    }
  }
}
