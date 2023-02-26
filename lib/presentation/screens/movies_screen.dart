import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';

import '../../authentification/controllers/auth_controller.dart';
import '../../business_logic/cubit/movies_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/movies.dart';
import '../widgets/movies_list_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> allMovies = [];
  bool _isSearching = false;
  bool isDescending = false;
  bool _iconBool = false;

  IconData _logout = Icons.logout;

  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).GetAllMovies();
    super.initState();
  }

  Widget buildBlockWidget() {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          allMovies = (state).movies;
          return MoviesListwidget(
            allMovies: allMovies,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Movie App',
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/nointernet.gif')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Auth().signOut();
            },
            icon: Icon(_logout),
          )
        ],
        title: _buildAppBarTitle(),
      ),
      body: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;

            if (connected) {
              return buildBlockWidget();
            } else {
              return buildNoInternetWidget();
            }
          },
          child: showLoadingIndicator()),
    );
  }
}
