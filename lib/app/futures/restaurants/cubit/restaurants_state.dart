part of 'restaurants_cubit.dart';

@immutable
class RestaurantsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String erroMessage;

  const RestaurantsState({
    required this.documents,
    required this.isLoading,
    required this.erroMessage,
  });
}
