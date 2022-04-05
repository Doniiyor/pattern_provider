import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../models/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_services.dart';

class EditViewModel extends ChangeNotifier {


  void apiUpdateNote(Post post, context) async {
    await Network.PUT(Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(post));


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
      return HomePage();
    }));

  }


}