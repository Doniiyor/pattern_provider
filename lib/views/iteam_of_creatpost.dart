import 'package:flutter/material.dart';

import '../view_model/creat_viewmodel.dart';


Widget iteamCreatPost(CreatViewModel viewModel, BuildContext context) {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    child: Column(
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 5, top: 16),
              hintText: "Title",
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: contentController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 5, top: 16),
              hintText: "Content",
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            viewModel.savePost(titleController, contentController, context);
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
