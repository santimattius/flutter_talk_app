import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_talk_app/src/movies/domain/movie.dart';
import 'package:flutter_talk_app/src/movies/domain/movie_repository.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;

  MovieBloc(this._movieRepository) : super(Initial()) {
    on<MovieEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(MovieEvent event, Emitter<MovieState> emit) async {
    emit(Loading());
    try {
      final result = await _movieRepository.getPopularMovies();
      emit(Loaded(movies: result));
    } catch (error) {
      emit(Failure(message: 'Ha ocurrido un error'));
    }
  }
}
