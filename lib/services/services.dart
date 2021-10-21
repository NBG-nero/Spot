import 'package:preview/core/models/models.dart';
import 'package:http/http.dart';

class Services {
  final url = 'https://jsonplaceholder.typicode.com/albums';

  fetchAlbums() async {
    try {
      var response = await get(Uri.parse(url));
      if (200 == response.statusCode) {
        List<Model> model = modelFromJson(response.body);
        // print(model);
        return model;
      }
    } catch (err) {
      print(err);
    }
  }
}
