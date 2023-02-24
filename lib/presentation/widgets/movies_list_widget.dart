import 'package:flutter/material.dart';
import '../../data/models/movies.dart';
import 'movie_item.dart';

class MoviesListwidget extends StatelessWidget {
  List<Movie>? allMovies;
  MoviesListwidget({required this.allMovies, super.key});

  @override
  Widget build(BuildContext context) {
    allMovies?.sort((a, b) => a.metascore!.compareTo(b.metascore!));
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: allMovies?.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              child: MovieItem(
                movie: allMovies![index],
              ));
        });
  }
}
