import 'package:flutter/material.dart';
import 'package:movieApp/model/movie.dart';

class MovieDetailPoster extends StatelessWidget {
  final Movie movie;
  MovieDetailPoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(movie.images[1].toString()),
          SizedBox(width: 16),
          Expanded(
            child: MovieDetailHeader(movie),
          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  MoviePoster(this.poster);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;
  MovieDetailHeader(this.movie);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year} - ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.cyan,
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(
                text: "More....",
                style: TextStyle(
                  color: Colors.indigoAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
