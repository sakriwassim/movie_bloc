import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/movies_cubit.dart';
import '../../data/repository/movies_repository.dart';
import '../../data/web_services/movies_web_services.dart';
import '../../presentation/screens/movies_screen.dart';
import '../controllers/auth_controller.dart';
import 'auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late MoviesRepository moviesRepository = MoviesRepository(MoviesWebServices());
late MoviesCubit moviesCubit = MoviesCubit(moviesRepository);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<MoviesCubit>(
              create: (context) => moviesCubit,
              child: const MoviesScreen(),
            );
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
