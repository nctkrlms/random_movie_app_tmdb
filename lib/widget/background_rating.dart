import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants.dart';
import '../data/movie_data.dart';
import '../screen/movie_screen.dart';


class BackgroundRating extends StatelessWidget {
  const BackgroundRating({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.7,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.7 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://image.tmdb.org/t/p/original${movie.imagePath}'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/star_fill.svg'),
                      const SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: '${movie.movieRate}'.substring(0,3),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                                text: '/10\n'
                            ),
                            // TextSpan(
                            //   text: '150,212',
                            //   style: TextStyle(
                            //     color: kTextLightColor,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SafeArea(child: BackButton(
            onPressed: (){Get.to(FutureBuilderMovie(),
                preventDuplicates: false);},
          )),
        ],
      ),
    );
  }
}