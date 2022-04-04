import 'package:flutter/material.dart';
import 'package:statemanagement/api%20folder/ModelApi.dart';
import 'package:statemanagement/api%20folder/apiitem.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApi();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchApi(), builder: (BuildContext context, AsyncSnapshot<ModelApi> snapshot) {

          if(snapshot.hasData){
            return Center(
              child: Text(snapshot.data!.results![0].voteCount.toString()),
            );
          }
          return Container();
        }

         )
    );
  }
}
