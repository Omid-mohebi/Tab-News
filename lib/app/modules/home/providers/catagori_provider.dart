import 'package:get/get.dart';

import 'package:my_new_try/app/modules/home/catagori_model.dart';

class CatagoriProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Category.fromJson(map);
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response<Category>> getCatagori(int id) async =>
      await get('catagori/$id');
  Future<Response<Category>> postCatagori(Category catagori) async =>
      await post('catagori', catagori);
  Future<Response> deleteCatagori(int id) async => await delete('catagori/$id');
}
