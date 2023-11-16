import 'package:http/http.dart' as http;

class laravelService {
  Future getMenu() async {
    var response = await http.get(Uri.https('foodbukka.herokuapp.com',
        '/api/v1/restaurantd0aca3e7d41c/menu/5f5eccf3e923'));
    print(response.body);
  }
}
