part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  final List<Object> _props;

  const MovieEvent([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class Initialize extends MovieEvent {}

class Refresh extends MovieEvent {}
