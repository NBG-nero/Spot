import 'package:flutter/widgets.dart';
import 'package:preview/services/services.dart';
import 'package:preview/core/models/models.dart';

class AlbumProvider extends ChangeNotifier {
  final Services service = Services();
  List<Model> _model = [];
  List<Model> get model => _model;

  getAlbums() async {
    final result = await service.fetchAlbums();
    if (result == 'error') {
      print('An error occured');
    } else {
      _model = result;
      notifyListeners();
    }
  }
}
