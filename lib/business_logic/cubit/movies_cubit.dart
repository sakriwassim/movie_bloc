// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/movies.dart';
import '../../data/repository/movies_repository.dart';
part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository moviesRepository;
  List<Movie> movies = [];

  MoviesCubit(
    this.moviesRepository,
  ) : super(MoviesInitial());

  List<Movie> GetAllMovies() {
    moviesRepository.getAllMovies().then((movies) {
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });
    return movies;
  }
}
