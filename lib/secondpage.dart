import 'package:flutter/material.dart';
import 'package:statemanagement/moonfall%20api/MoonfallModel.dart';
import 'package:statemanagement/moonfall%20api/moonfallapii.dart';

class HomeTwo extends StatefulWidget {
  HomeTwo({Key? key,required this.name, required this.image}) : super(key: key);
   String name;
   String image;


  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: moonfall(widget.name),
        builder: (BuildContext context, AsyncSnapshot<MoonfallModel> snapshot) {
          if(snapshot.hasData){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    child: Center(child:

               snapshot.data!.budget != null ?     Text(snapshot.data!.budget!.toString()):Container()),
                  ),
                ),
                Image.network(widget.image)

              ],
            );
          }
          return Container();

        },)
    );
  }
}
