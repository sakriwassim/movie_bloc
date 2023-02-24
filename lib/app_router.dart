import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/screens/movies_screen.dart';

import 'authentification/pages/entry_view.dart';
import 'business_logic/cubit/movies_cubit.dart';
import 'constants/strings.dart';
import 'data/models/movies.dart';
import 'data/repository/movies_repository.dart';
import 'data/web_services/movies_web_services.dart';
import 'presentation/screens/movies_details_screen.dart';

class AppRouter {
  late MoviesRepository moviesRepository;
  late MoviesCubit moviesCubit;

  AppRouter() {
    moviesRepository = MoviesRepository(MoviesWebServices());
    moviesCubit = MoviesCubit(moviesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case movieScreens:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => moviesCubit,
            child: const MoviesScreen(),
          ),
        );
      case movieDetailScreens:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
            builder: (_) => MoviesDetailsScreen(
                  movie: movie,
                ));
    }
  }
}
