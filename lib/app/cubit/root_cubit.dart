import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          const RootState(
            user: null,
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  } //Event z onPressed

  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        isLoading: false,
        errorMessage: '',
      ),
    );
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(RootState(
        user: user,
        isLoading: false,
        errorMessage: '',
      ));
    })
          ..onError(
            (error) {
              emit(
                RootState(
                  user: null,
                  isLoading: false,
                  errorMessage: error.toString(),
                ),
              );
            },
          );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
