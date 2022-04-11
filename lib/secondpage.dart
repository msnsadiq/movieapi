//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:statemanagement/moonfall%20api/MoonfallModel.dart';
import 'package:statemanagement/moonfall%20api/moonfallapii.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTwo extends StatefulWidget {
  //HomeTwo({Key? key,required this.name, required this.image}) : super(key: key);

  String iddata;
  // String image;

  HomeTwo({
    required this.iddata,

    // required this.image
  });

  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {
  @override
  bool isloading = false;
  bool tappp = false;
  changeBool() {
    tappp = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: FutureBuilder(
            future: moonfall(widget.iddata),
            builder:
                (BuildContext context, AsyncSnapshot<MoonfallModel> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      snapshot.data!.posterPath != null
                          ? "assets/errorpic/noterror.jpg"
                          : "assets/errorpic/error.jpg",
                    ),
                    fit: BoxFit.fill,
                  )),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        snapshot.data!.title != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(33, 19, 0, 0),
                                    child: Text(
                                      snapshot.data!.title.toString(),
                                      style: GoogleFonts.bevan(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              )
                            : Text(
                                "Trending Movie",
                                style: GoogleFonts.bevan(
                                    color: Colors.white, fontSize: 20),
                              ),
                        snapshot.data!.runtime != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 0, 0, 0),
                                  child: Text(
                                    "RunTime:  " +
                                        snapshot.data!.runtime.toString() +
                                        "m",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        snapshot.data!.originalLanguage != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 0, 0, 0),
                                  child: Container(
                                      child: Text(
                                    "language:  " +
                                        snapshot.data!.originalLanguage
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        snapshot.data!.originalLanguage != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 0, 0, 0),
                                  child: Container(
                                      child: Text(
                                    "Release Date:  " +
                                        snapshot.data!.releaseDate.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        snapshot.data!.posterPath != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 38.0, left: 15),
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Card(
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500" +
                                          snapshot.data!.posterPath.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        snapshot.data!.posterPath != null
                            ? Card(
                                elevation: 19,
                                color: Colors.blueGrey,
                                child: Text(
                                  snapshot.data!.title.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        snapshot.data!.overview != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(30, 10, 5, 0),
                                  child: Text(
                                    snapshot.data!.overview.toString(),
                                    style: TextStyle(color: Colors.white),
                                    maxLines: isloading ? null : 1,
                                    overflow: isloading ? TextOverflow.visible : TextOverflow.ellipsis
                                  ),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        snapshot.data!.posterPath != null ?   TextButton(onPressed: (){
                          setState(() {
                            isloading = !isloading;
                          });
                        }, child: Text(isloading ? "show less" : "show more")): SizedBox(),
                        snapshot.data!.voteAverage != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SizedBox(
                                    height: 30,
                                    width: 350,
                                    child: snapshot.data!.posterPath != null
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 26.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.imdb,
                                                  color: Colors.yellow,
                                                ),
                                                Text(
                                                  snapshot.data!.voteAverage
                                                          .toString() +
                                                      "/10",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),

                                                // Icon(
                                                //   FontAwesomeIcons.star,
                                                //   color: Colors.blue,
                                                //   size: 18,
                                                // ),
                                                GestureDetector(
                                                  onDoubleTap: () {
                                                    setState(() {
                                                      tappp = false;
                                                    });
                                                  },
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          changeBool();
                                                        });
                                                      },
                                                      icon: tappp
                                                          ? Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 20,
                                                            )
                                                          : Icon(
                                                              FontAwesomeIcons
                                                                  .star,
                                                              color:
                                                                  Colors.blue,
                                                              size: 18,
                                                            )),
                                                ),

                                                Text(
                                                  "Rate",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                      fontSize: 21),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox()),
                              )
                            : Center(
                                child: Text("sorry, the page not found",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                        snapshot.data!.posterPath != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 48.0),
                                child: SizedBox(
                                  height: 30,
                                  width: 250,
                                  child: Card(
                                    color: Colors.grey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Text(
                                          "Add to Watchlist",
                                          style: GoogleFonts.rubikBeastly(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Text(""),
                        snapshot.data!.posterPath != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 68.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              "https://www.facebook.com");
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              "https://www.instagram.com");
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              'https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D');
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              'https://www.youtube.com/');
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.youtube,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
