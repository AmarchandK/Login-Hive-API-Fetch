import 'package:get/state_manager.dart';
import 'package:movie_details/model/request.dart';
import 'package:movie_details/model/response.dart';
import 'package:movie_details/service/service.dart';

class HomeController extends GetxController {
  List<Result?> data = [];
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = !isLoading.value;
    RequestModel requestModel = RequestModel(
        category: "movies", language: "kannada", genre: "all", sort: "voting");
    ResponseModel? response =
        await MovieService.postMethord(model: requestModel);
    if (response != null) {
      data.clear();
      data = response.result;
    }
    isLoading.value = !isLoading.value;
    update();
  }
}
