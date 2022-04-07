import 'package:flutter/material.dart';
import 'package:statemanagement/api%20folder/ModelApi.dart';
import 'package:statemanagement/api%20folder/apiitem.dart';
import 'package:statemanagement/moonfall%20api/MoonfallModel.dart';
import 'package:statemanagement/moonfall%20api/moonfallapii.dart';
import 'package:statemanagement/secondpage.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final String baseurl = "https://image.tmdb.org/t/p/w185";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchApi(),
            builder: (BuildContext context, AsyncSnapshot<ModelApi> snapshot) {
              if (snapshot.hasData) {
                // return Center(
                //   child: Container(
                //     height: 200,
                //     width: double.infinity,
                //     child: Image.network(
                //       "https://image.tmdb.org/t/p/w185" +
                //           snapshot.data!.results![1].backdropPath.toString(),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // );
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/image/bgpic.jpg",),fit: BoxFit.cover)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(top:8.0, bottom: 8,left: 8,right: 8),
                    child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 2,
                        children:
                            List.generate(snapshot.data!.results!.length, (index) {

                          return Stack(

                            children: [

                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: (){
                                    print("taped $index");
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                                        HomeTwo(name: snapshot.data!.results![index].id.toString(),
                                          image:baseurl + snapshot.data!.results![index].posterPath.toString(),)));
                                  },
                                  child: Card(
                                    elevation: 15,
                                    shadowColor: Colors.black,
                                    color: Colors.grey,
                                   // margin: EdgeInsets.symmetric(horizontal: 33),
                                    child: Image.network(
                                      baseurl +
                                          snapshot.data!.results![index].posterPath
                                              .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              snapshot.data!.results![index].title != null ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  snapshot.data!.results![index].title.toString(),
                                  style: TextStyle(color: Colors.white,fontSize: 11,
                                      fontFamily: "titlestyle",
                                  ),
                                ),
                              ): Container(),
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
                        })),
                  ),
                );
              }
              return Container();
            }));
  }
}
