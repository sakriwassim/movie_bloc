import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/movies.dart';

class MoviesDetailsScreen extends StatelessWidget {
  final Movie? movie;

  const MoviesDetailsScreen({Key? key, required this.movie}) : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie?.title ?? "",
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: movie?.imdbID ?? "",
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: "${movie?.poster}",
            placeholder: (context, url) =>
                Center(child: new CircularProgressIndicator()),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget movieInfo(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      movieInfo('Title : ', movie?.title ?? ""),
                      buildDivider(310),
                      movieInfo('Year : ', movie?.year ?? ""),
                      buildDivider(310),
                      movieInfo('Actors : ', movie?.actors ?? ""),
                      buildDivider(300),
                      movieInfo('Director : ', movie?.director ?? ""),
                      buildDivider(290),
                      movieInfo('Writer : ', movie?.writer ?? ""),
                      buildDivider(290),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
