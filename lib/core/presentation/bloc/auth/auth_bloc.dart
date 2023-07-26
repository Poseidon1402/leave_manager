import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/repository/user_repository.dart';
import '../../../domain/entity/user_entity.dart';
import '../../../utils/enum/load_status.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('user');
  final _rep = UserRepository();

  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEventLogin>(_mapLoginEventToState);
    on<AuthEventSubscribe>(_mapSubscribeEventToState);
  }

  void _mapLoginEventToState(
      AuthEventLogin event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final user = await _rep.getUserByEmail(event.email);
      emit(AuthState.success(user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const AuthState.error('Aucun utilisateur trouvé pour cet email.'));
      } else if (e.code == 'wrong-password') {
        emit(const AuthState.error('Mot de passe incorrect.'));
      } else {
        emit(const AuthState.error('Une erreur est survenue.'));
      }
    } catch (e) {
      print(e);
      emit(const AuthState.networkError());
    }
  }

  void _mapSubscribeEventToState(
      AuthEventSubscribe event, Emitter<AuthState> emit
      ) async {
    emit(const AuthState.loading());
    try {
      await _auth.createUserWithEmailAndPassword(
        email: event.user.email,
        password: event.password,
      );
      await _firestore.add(event.user.toJson());
      emit(AuthState.success(event.user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const AuthState.error('Le mot de passe est trop faible.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const AuthState.error('Cet email est déjà utilisé.'));
      } else {
        emit(const AuthState.error('Une erreur est survenue.'));
      }
    } catch (e) {
      emit(const AuthState.networkError());
    }
  }
}