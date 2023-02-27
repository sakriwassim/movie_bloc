import 'package:flutter/material.dart';
import '../../data/models/movies.dart';
import 'movie_item.dart';

class MoviesListwidget extends StatelessWidget {
  List<Movie>? allMovies;
  MoviesListwidget({required this.allMovies, super.key});

  @override
  Widget build(BuildContext context) {
    var movie = allMovies!
      ..sort((a, b) => a.metascore!.compareTo(b.metascore!));
    var Movies15 = movie.sublist(0, 15);
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: Movies15.length,
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
