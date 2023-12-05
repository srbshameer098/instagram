

import 'dart:convert';

import 'package:http/http.dart';
import 'package:instagram/Repository/ModelClass/insta_model.dart';

import 'api_client.dart';

class InstaApi {
  ApiClient apiClient = ApiClient();


  Future<InstaModel> getInsta(String text) async {
    String trendingpath = 'https://instagram130.p.rapidapi.com/account-info?username=$text';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', (body));

    return InstaModel.fromJson(jsonDecode(response.body));
  }
}