
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speakyeasy/models/carousel.dart';
import 'package:speakyeasy/services/remote_services.dart';

class HomeController extends GetxController{
  var box = GetStorage();
  var isLoading = false;
  List<Carousel> carouselData = [];

  @override
  void onInit() {
    fetchCarousel();
    if(box.read('carouselData') != null)
      carouselData.assignAll(box.read('carouselData'));
    super.onInit();
  }

  void fetchCarousel() async {
    try{
      isLoading = true;
      update();

      List<Carousel> _data = await RemoteService.fetchCarouselData();
      if(_data != null){
        carouselData.assignAll(_data);
        box.write('carouselData', _data);
      }
    }finally{
      isLoading = false;
      update();
      print('data fetch done');
    }
  }
}