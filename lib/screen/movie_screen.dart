import 'dart:math';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:future_movie/restart/restarat.dart';
import 'package:future_movie/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restart_app/restart_app.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import '../data/movie_data.dart';
import 'movie_detail_screen.dart';

class FutureBuilderMovie extends StatefulWidget {
  int releaseMin;
  int releaseMax;
  FutureBuilderMovie({Key? key, this.releaseMax = 2000, this.releaseMin = 2022})
      : super(key: key);

  @override
  State<FutureBuilderMovie> createState() => _FutureBuilderMovieState();
}

class _FutureBuilderMovieState extends State<FutureBuilderMovie> {
  late Future<Movie> futureMovie;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    int randomNumber = random.nextInt(400000) + 100;
    futureMovie = UrlHandler().fetchMovie(randomNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movie>(
          future: futureMovie,
          builder: (context, snapshot) {
            return GestureDetector(
              child: FutureImage(
                futureMovie: futureMovie,
                releaseMax: widget.releaseMax,
                releaseMin: widget.releaseMin,
              ),
              onTap: () {
                Get.to(MovieDetailPage(
                  movie: snapshot.data!,
                  imagePath: snapshot.data!.imagePath,
                ));
              },
            );
          }),
    );
  }
}

class FutureImage extends StatelessWidget {
  const FutureImage({
    super.key,
    required this.futureMovie,
    required this.releaseMax,
    required this.releaseMin,
  });

  final Future<Movie> futureMovie;
  final int releaseMax;
  final int releaseMin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();
    return FutureBuilder<Movie>(
      future: futureMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.adult == false &&
            snapshot.data!.movieRate >= 5) {
          print('Coming HERE *********');
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/original${snapshot.data!.posterPath}',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SwipeableCardsSection(
                            cardHeightBottomMul: 0.8,
                            cardHeightMiddleMul: 0.8,
                            cardHeightTopMul: 0.8,
                            context: context,
                            cardController: _cardController,
                            onCardSwiped: (dir, index, widget) {
                              if (dir == Direction.left) {
                                Get.to(FutureBuilderMovie(),
                                    preventDuplicates: false);
                              } else if (dir == Direction.right) {
                                Get.to(MovieDetailPage(
                                  movie: snapshot.data!,
                                  imagePath: snapshot.data!.imagePath,
                                ));
                              }
                            },
                            //
                            enableSwipeUp: true,
                            enableSwipeDown: false,
                            items: [
                              Container(
                                height: Get.height * 0.9,
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black.withOpacity(0.6)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      snapshot.data!.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 60,
                                          fontFamily: 'StarShield'),
                                    ),
                                    Container(
                                      height: Get.height * 0.5,
                                      width: Get.width * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/original${snapshot.data!.posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            //TODO: Bunları () => Page() yapısına çevirmeyi unutma.
                                            Get.to(FutureBuilderMovie(),
                                                preventDuplicates: false);
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .red
                                                    .withOpacity(0.4)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.thumb_down,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.to(MovieDetailPage(
                                              movie: snapshot.data!,
                                              imagePath:
                                                  snapshot.data!.imagePath,
                                            ));
                                            print(int.parse(snapshot
                                                .data!.releaseDate
                                                .substring(0, 4)));
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .lightGreenAccent
                                                    .withOpacity(0.4)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.thumb_up,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // snapshot.data!.tagline != ''
                          //     ? Expanded(
                          //         child: Padding(
                          //           padding:
                          //               const EdgeInsets.only(bottom: 0.0),
                          //           child: Align(
                          //             alignment: Alignment.bottomCenter,
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                   color:
                          //                       Colors.black.withOpacity(0.3),
                          //                   borderRadius: BorderRadius.only(
                          //                       topLeft: Radius.circular(50),
                          //                       topRight:
                          //                           Radius.circular(50))),
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(20.0),
                          //                 child: AnimatedTextKit(
                          //                   animatedTexts: [
                          //                     TyperAnimatedText(
                          //                       snapshot.data!.tagline,
                          //                       textAlign: TextAlign.center,
                          //                       textStyle: TextStyle(
                          //                         color: Colors.white,
                          //                         fontSize: 24,
                          //                         fontFamily: 'Cycle',
                          //                       ),
                          //                       speed: const Duration(
                          //                           milliseconds: 80),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox(
                          //         height: 0,
                          //       ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return RestartWidget(child: FutureBuilderMovie());
        } else if (snapshot.data?.adult == true ||
            snapshot.data!.movieRate <= 5) {
          return RestartWidget(child: FutureBuilderMovie());
        }
        return Center(child: CircularProgressIndicator());

        // By default, show a loading spinner.
      },
    );
  }
}
