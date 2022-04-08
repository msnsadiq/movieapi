import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:statemanagement/moonfall%20api/MoonfallModel.dart';
import 'package:statemanagement/moonfall%20api/moonfallapii.dart';

class HomeTwo extends StatelessWidget {
  //HomeTwo({Key? key,required this.name, required this.image}) : super(key: key);
   String iddata;
  // String image;

HomeTwo({required this.iddata,

  // required this.image
});
  @override


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: FutureBuilder(
            future: moonfall(iddata),
            builder: (BuildContext context,
                AsyncSnapshot<MoonfallModel> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                     SizedBox(height: 20,),

                  snapshot.data!.title != null ?    Container(
                    width: 350,
                    child: Padding (
                            padding: EdgeInsets.fromLTRB(33, 19, 0, 0),
                            child:

                            Text(snapshot.data!.title.toString(),style: GoogleFonts.bevan(color: Colors.white,fontSize: 20),)),
                  ): Text("Trending Movie"),
                       SizedBox(
                         width: 350,
                         child: Padding(
                           padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                           child: Text("RunTime:  " + snapshot.data!.runtime.toString()+ "m",style: TextStyle(color: Colors.white,)),
                         ),
                       ),
                          SizedBox(
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                              child: Container(child: Text("language:  " + snapshot.data!.originalLanguage.toString(),style: TextStyle(color: Colors.white),)),
                            ),
                          ),

                      Padding(
                        padding: const EdgeInsets.only(top: 38.0),
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Card(

                            child:
                            Image.network("https://image.tmdb.org/t/p/w500"+snapshot.data!.posterPath.toString(),fit: BoxFit.cover,),
                          ),
                        ),
                      ),

                      Card(
                        elevation: 19,
                              color: Colors.blueGrey,
                              child: Text(snapshot.data!.title .toString(),style: TextStyle(color: Colors.white),),
                            ),

                      SizedBox(
                        width: 350,
                        child: Padding(padding: EdgeInsets.fromLTRB(30, 10, 5, 0),
                          child: Text(snapshot.data!.overview.toString(),style: TextStyle(color: Colors.white),),

                        ),
                      ),
                 Padding(
                   padding: const EdgeInsets.only(top: 18.0),
                   child: SizedBox(
                     height: 30,
                     width: 350,
                     child: Padding(
                       padding: const EdgeInsets.only(left :26.0),
                       child: Row(
                         children: [
                           Icon(Icons.star,color: Colors.yellow,),
                           Text( snapshot.data!.voteAverage.toString()+"/10",style: TextStyle(color: Colors.white),),
                           
                         ],
                       ),
                     ),
                   ),
                 ),



                    ],
                  ),) ;
              }
              return Container();
            },)
      ),
    );
  }
}



