
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:statemanagement/api%20folder/ModelApi.dart';
import 'package:statemanagement/api%20folder/apiitem.dart';
import 'package:statemanagement/moonfall%20api/MoonfallModel.dart';
import 'package:statemanagement/moonfall%20api/moonfallapii.dart';
import 'package:statemanagement/secondpage.dart';

class ScreenHome extends StatelessWidget {
  final String baseurl = "https://image.tmdb.org/t/p/w185";

  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await exitBtn(context);
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 20,
            title: Text(
              "Trending Movies",
              style: GoogleFonts.aclonica(color: Colors.black),
            ),
            backgroundColor: Colors.grey,
            leading: Icon(
              Icons.slow_motion_video_rounded,
              size: 20,
              color: Colors.black,
            ),
          ),
          body: FutureBuilder(
              future: fetchApi(),
              builder:
                  (BuildContext context, AsyncSnapshot<ModelApi> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/image/bgpic.jpg",
                            ),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 3.0, bottom: 8, left: 8, right: 8),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (ctx, index) {
                          return Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    print("taped $index");
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return HomeTwo(
                                        iddata: snapshot
                                            .data!.results![index].id
                                            .toString(),
                                        // image: baseurl +
                                        //     snapshot
                                        //         .data!
                                        //         .results![index]
                                        //         .posterPath
                                        //         .toString(),
                                      );
                                    }));
                                  },
                                  child: Card(
                                    elevation: 15,
                                    shadowColor: Colors.black,
                                    color: Colors.grey,
                                    // margin: EdgeInsets.symmetric(horizontal: 33),
                                    child: Image.network(
                                      baseurl +
                                          snapshot
                                              .data!.results![index].posterPath
                                              .toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              snapshot.data!.results![index].title != null
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                          snapshot.data!.results![index].title
                                              .toString(),
                                          style: GoogleFonts.michroma(
                                            color: Colors.white,
                                            fontSize: 11,
                                          )),
                                    )
                                  : Container(),

                              // FutureBuilder(
                              //   // future: moonfall(),
                              //   builder: (BuildContext context, AsyncSnapshot<MoonfallModel> snapshot) {
                              //   if(snapshot.hasData){
                              //     return Column(
                              //
                              //     );
                              //
                              //   }
                              //   return Container();
                              // },),
                              // HomeTwo(name: "fasil $index")
                            ],
                          );
                        },
                        // crossAxisCount: 2,
                        // mainAxisSpacing: 20,
                        // crossAxisSpacing: 2,
                      ),
                    ),
                  );
                }
                return Container();
              })),
    );
  }

  exitBtn(BuildContext context) async {
    return showDialog(
        // barrierColor: Colors.black,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              "are you sure you want to exit",
              style: GoogleFonts.aladin(
                color: Colors.white,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          }
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.grey,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "NO",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
