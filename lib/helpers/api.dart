import 'dart:convert';
import 'package:http/http.dart' as http;

var url = 'https://ovoapi.onrender.com';

class Api {
  requestPost(String urlDestiny, data) async {
    try {
      var body = jsonEncode(data);

      http.Response response;

      print(url + urlDestiny);
      print(body);

      response = await http.post(Uri.parse(url + urlDestiny),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      return {'statusCode': response.statusCode};
    } catch (e) {
      print('erro request post! ');
      print(e);
    }
  }

  requestGet(String urlDestiny) async {
    try {
      http.Response response;

      print('\n\n token requestGet');
      print(Uri.parse(url + urlDestiny));

      response = await http.get(
        Uri.parse(url + urlDestiny),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var decodedResponse = json.decode(response.body);

      print('\n\n decodedResponse');
      print(decodedResponse);

      return {'statusCode': response.statusCode, 'data': decodedResponse};
    } on Exception catch (e) {
      print('erro request get! ');
      print(e);
    }
  }
}
