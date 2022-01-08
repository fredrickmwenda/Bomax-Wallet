// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:bodax_wallet/presentation/core/models/new_model.dart';
import 'dart:async';
import 'package:http/http.dart';

class NewsApi {
  Client client = Client();

  // List<News> parseNews(String responseBody) {
  //   // ignore: avoid_dynamic_calls
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   print(parsed);
  //   // return parsed.map<News>((json) => News.fromMap(json)).toList();
  // }

  Future<News> fetchNewsList() async {
    var queryparams = {
      //pass the query parameters here
      'lang': 'EN',
      'extraParams': 'crypto-news',
    };

    var url = 'https://min-api.cryptocompare.com/data/v2/news/';
    //use parse instead of http to use query parameters
    var uri = Uri.parse(url).replace(queryParameters: queryparams);
    final response = await client.get(
      uri,
      headers: {'Accept': 'application/json'},
    );
    print(response.body);

    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body));
      // return par
    } else {
      throw Exception('Unable to fetch news from the REST API');
    }
  }
}
