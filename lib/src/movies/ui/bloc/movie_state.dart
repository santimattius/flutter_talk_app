part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  final List<Object> _props;

  const MovieState([this._props = const <Object>[]]);

  @override
  List<Object?> get props => _props;
}

///initial state
class Initial extends MovieState {}

/// empty result
class Empty extends MovieState {}

/// loading
class Loading extends MovieState {}

/// loaded state with result
class Loaded extends MovieState {
  final List<Movie> movies;

  Loaded({required this.movies}) : super([movies]);
}

/// failure message
class Failure extends MovieState {
  final String message;

  Failure({required this.message}) : super([message]);
}
