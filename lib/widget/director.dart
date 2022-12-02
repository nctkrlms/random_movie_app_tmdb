import 'package:flutter/material.dart';


import '../../../constants.dart';
import '../data/movie_data.dart';
import 'cast_card.dart';


class Director extends StatelessWidget {
  final Movie movie;

  const Director({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Yönetmen",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) => CastCard(movie: movie,),
            ),
          )
        ],
      ),
    );
  }
}