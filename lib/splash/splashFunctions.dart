import '../helpers/api.dart';
import '../helpers/getDeviceInfo.dart';
import '../helpers/sharedPreferences.dart';

class SplashFunctions {
  Future checkIfDeviceIdIsRegisteredAndCallScreen() async {
    print('checkIfDeviceIdIsRegisteredAndCallScreen: ');

    String? deviceId = await getDeviceIdentifier();

    var response = await Api().requestGet('/user/deviceId/$deviceId');

    print('RESPONSE SPLASH');
    print(response);

    if (response['statusCode'] == 200) {
      print('if 200');

      if (response['data'] != null) {
        print('if data != null');

        SharedPreferencesUtils().setString('USER_ID', response['data']['id']);
        SharedPreferencesUtils().setString('NAME', response['data']['name']);
        print('set shared preferences');
        return true;
      } else {
        return false;
      }
    } else {
      print('Erro ao buscar deviceId');
      print(response.toString());
      // tratar erros: usuário/senha errado OU não cadastrado
    }
  }
}
