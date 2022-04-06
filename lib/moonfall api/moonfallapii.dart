import 'dart:convert';

import 'package:http/http.dart' as http;

import 'MoonfallModel.dart';

Future<MoonfallModel>moonfall(String id)async{
  final collection = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id?api_key=8417e5718758d632f59c399f948b60ea'));
  final items = json.decode(collection.body);
   return  MoonfallModel.fromJson(items);
}
