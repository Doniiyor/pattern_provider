import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../view_model/edit_viewmodel.dart';


Widget itemEditPost(EditViewModel viewModel, BuildContext context, Post post) {
  TextEditingController titleController = TextEditingController(text: post.title);
  TextEditingController contentController = TextEditingController(text: post.content);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                //   hintText: "Enter your note!",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: contentController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                // hintText: "Enter your note!",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            Post _post = Post(
                title: titleController.text,
                content: contentController.text,
                id: post.id);
            viewModel.apiUpdateNote(_post, context);
          },
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          minWidth: 300,
          height: 40,
          shape: StadiumBorder(),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
