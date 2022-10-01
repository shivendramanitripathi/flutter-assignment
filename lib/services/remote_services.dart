
import 'package:http/http.dart' as http;
import 'package:speakyeasy/models/carousel.dart';

class RemoteService {
  static var client = http.Client();
  
  static Future<dynamic> fetchCarouselData() async {
    try{
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),

      );
      if(response.statusCode == 200){
        return carouselFromJson(response.body);
      }
      return null;
    } catch(e){
      return null;
    }
  }
}