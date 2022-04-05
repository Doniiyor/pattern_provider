import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../models/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_services.dart';

  class CreatViewModel extends ChangeNotifier {


  savePost (TextEditingController titleController, TextEditingController contentController, BuildContext context) {
    if(contentController.text.isNotEmpty) {
      String title = titleController.text.trim().toString();
      String content = contentController.text.trim().toString();

      Post post = Post(content: content, title: title);
      Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value){
      //  getResponse(value);
       // print(value);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
         return HomePage();
       }));
      });
    }


  }


}