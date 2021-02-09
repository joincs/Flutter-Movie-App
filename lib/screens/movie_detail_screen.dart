import 'package:flutter/material.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/widget/horizontalLine.dart';
import 'package:movieApp/widget/movie_detail_cast.dart';
import 'package:movieApp/widget/movie_detail_extra_posters.dart';
import 'package:movieApp/widget/movie_detail_poster.dart';
import 'package:movieApp/widget/movie_detail_thumbnail.dart';

class MovieListViewDetail extends StatelessWidget {
  final Movie movie;

  MovieListViewDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Movie App"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MovieDetailThumbnail(movie.images[0]),
          MovieDetailPoster(movie),
          HorizontalLine(),
          MovieDetailCast(movie),
          HorizontalLine(),
          MovieDetailExtraPosters(movie.images)
        ],
      ),
    );
  }
}
