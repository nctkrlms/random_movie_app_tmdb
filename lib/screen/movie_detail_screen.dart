import 'package:flutter/material.dart';
import 'package:future_movie/data/movie_data.dart';

import '../constants.dart';
import '../widget/background_rating.dart';
import '../widget/director.dart';
import '../widget/genre_list.dart';
import '../widget/movie_details_text.dart';

class MovieDetailPage extends StatefulWidget {
  final String imagePath;
  final Movie movie;

  const MovieDetailPage({

    Key? key,
    required this.imagePath,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late List genreList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genreList = widget.movie.genres;
  }
  @override

  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackgroundRating(size: size, movie: widget.movie),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            MovieDetailsText(movie: widget.movie),
            GenreList(movie: widget.movie),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: kDefaultPadding,
              ),
              child: Text(
                'Movie Summary',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                widget.movie.description,
                style: TextStyle(
                  color: Color(0xFF737599),
                ),
              ),
            ),
            const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
