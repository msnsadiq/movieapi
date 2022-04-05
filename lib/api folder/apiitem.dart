import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ModelApi.dart';

  Future<ModelApi>fetchApi()async{
  final result = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=a5621ef03b6cb42a8c1ffb828d33ba8c'));

   // print(result.body);
    final values = json.decode(result.body);
     ModelApi.fromJson(values);
    return ModelApi.fromJson(values);
    





  }
