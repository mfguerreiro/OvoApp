import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading() async {
  await EasyLoading.show(
    status: 'carregando',
    maskType: EasyLoadingMaskType.black,
  );
}

void dismissLoading() {
  EasyLoading.dismiss();
}
