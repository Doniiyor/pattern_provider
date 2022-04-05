import 'package:flutter/foundation.dart';

import '../models/post_model.dart';
import '../services/http_services.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> items = [];

  void apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
    isLoading = false;
    notifyListeners();
  }
}
