import 'package:flutter/material.dart';
import 'package:future_movie/screen/movie_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants.dart';
import '../data/movie_data.dart';


class MovieDetailsText extends StatelessWidget {
  const MovieDetailsText({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: kDefaultPadding/2,),
                Row(
                  children: [
                    Text(movie.releaseDate.substring(0,4),style: TextStyle(color: kTextLightColor),),
                    SizedBox(width: kDefaultPadding,),
                    SizedBox(width: kDefaultPadding,),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: ElevatedButton(
              onPressed: () {
                Get.to(FutureBuilderMovie());
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(kSecondaryColor),
              ),
              child: Icon(Icons.thumb_down),
            ),
          ),
        ],
      ),
    );
  }
}