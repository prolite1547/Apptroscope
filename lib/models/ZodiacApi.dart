 
import './Horoscope.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Horoscope> getData(String day, String zodiac) async {
    var response = await http.post(
        Uri.encodeFull(
            "https://aztro.sameerkumar.website/?sign="+zodiac+"&day="+day),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    Horoscope horoscope = new Horoscope.fromJson(data);
    return horoscope;
}
