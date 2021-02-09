import 'package:flutter/material.dart';

class MovieDetailExtraPosters extends StatelessWidget {
  final List<String> posters;
  MovieDetailExtraPosters(this.posters);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "More Movie Posters".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black26,
            ),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: posters.length,
            separatorBuilder: (context, index) => SizedBox(width: 8.0),
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      posters[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
