import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_talk_app/src/movies/domain/movie.dart';
import 'package:flutter_talk_app/src/movies/ui/detail_arguments.dart';
import 'package:flutter_talk_app/src/movies/ui/detail_page.dart';
import 'package:flutter_talk_app/src/movies/ui/widgets/loading_widget.dart';

class MovieItemCard extends StatelessWidget {
  final Movie movie;

  const MovieItemCard(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: DetailArguments(
                title: movie.title,
                description: movie.overview,
                image: movie.posterUrl,
                aspectRatio: 2 / 3));
      },
      child: Card(
        child: CachedNetworkImage(
          imageUrl: movie.posterUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const LoadingWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
