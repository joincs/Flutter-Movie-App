import 'package:flutter/material.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/screens/movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Movie App"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              movieCard(movieList[index], context),
              Positioned(
                top: 10,
                child: movieImage(movieList[index].images[0]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 54.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating}/10",
                        style: mainTextStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Released: ${movie.released}",
                            style: mainTextStyle(),
                          ),
                          Text(
                            movie.runtime,
                            style: mainTextStyle(),
                          ),
                          Text(
                            movie.rated,
                            style: mainTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return MovieListViewDetail(
                movie,
              );
            },
          ),
        );
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? null),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
