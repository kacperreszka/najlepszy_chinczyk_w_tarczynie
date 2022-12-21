import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit()
      : super(
          const RestaurantsState(
            documents: [],
            erroMessage: '',
            isLoading: false,
          ),
        );

  Future<void> start() async {
    emit(
      const RestaurantsState(
        documents: [],
        erroMessage: '',
        isLoading: true,
      ),
    );

    await Future.delayed(const Duration(seconds: 5));

    emit(
      const RestaurantsState(
        documents: [],
        erroMessage: 'Błąd Połączenia',
        isLoading: false,
      ),
    );
  }
}
