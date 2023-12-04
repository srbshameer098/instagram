

import 'dart:convert';

import 'package:http/http.dart';
import 'package:instagram/Repository/ModelClass/insta_model.dart';

import 'api_client.dart';

class ImagineApi {
  ApiClient apiClient = ApiClient();


  Future<InstaModel> getTranslate(String text) async {
    String trendingpath = 'https://instagram130.p.rapidapi.com/account-info?username=adele';
    var body = {
      "selected_model_id":"anything-v5",
      "selected_model_bsize":"512",
      "prompt":text
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return InstaModel.fromJson(jsonDecode(response.body));
  }
}