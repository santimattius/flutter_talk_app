import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_talk_app/src/injection_container.dart';
import 'package:flutter_talk_app/src/movies/ui/bloc/movie_bloc.dart';
import 'package:flutter_talk_app/src/movies/ui/widgets/loading_widget.dart';
import 'package:flutter_talk_app/src/movies/ui/widgets/message_widget.dart';
import 'package:flutter_talk_app/src/movies/ui/widgets/movie_item_card.dart';

const imageRatio = 2 / 3;

class MoviePage extends StatelessWidget {
  static const routeName = '/movies';

  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: BlocProvider<MovieBloc>(
        create: (_) => serviceLocator<MovieBloc>()..add(Initialize()),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            return _createBody(context, state);
          },
        ),
      ),
    );
  }

  Widget _createBody(BuildContext context, MovieState state) {
    switch (state.runtimeType) {
      case Loading:
        return const LoadingWidget();
      case Empty:
        return const MessageWidget(message: 'No se encontraron resultados');
      case Error:
        return const MessageWidget(message: 'Ha ocurrido un error');
      case Loaded:
        final movies = (state as Loaded).movies;
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: imageRatio),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieItemCard(movies[index]);
            });
    }
    return Container();
  }
}
