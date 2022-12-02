import 'package:flutter/material.dart';


import '../constants.dart';
import '../data/movie_data.dart';
import 'genre_card.dart';


class GenreList extends StatelessWidget {
  const GenreList({
    super.key,
    required this.movie,
  });

  final Movie movie;


  @override
  Widget build(BuildContext context) {
    final genre = movie.genres;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genre.length,
            itemBuilder: (context, index) => GenreCard(
              genre: genre[index].name,
            )),
      ),
    );
  }
}
