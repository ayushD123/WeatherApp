import 'package:http/http.dart';
import 'dart:convert';

class nethelper{
  nethelper(this.url);
  final String url;
  Future getData() async{
    Response r=await get( Uri.parse(url));
    String data=r.body;
    return jsonDecode(data);
  }
}