import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import '../models/post_model.dart';
import '../pages/edit_page.dart';
import '../view_model/home_viewmodel.dart';

Widget itemOfPost(HomeViewModel viewModel, Post post, BuildContext context) {
  return Slidable(
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      extentRatio: 0.20,
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            viewModel.apiPostDelete(post);
          },
          flex: 3,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        )
      ],
    ),
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      extentRatio: 0.20,
      children: [
        SlidableAction(
          onPressed: (context) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
              return EditPage(
                post: post,
              );
            }));
          },
          flex: 1,
          icon: Icons.edit,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          label: "Edit",
        ),
      ],
    ),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.content!)
        ],
      ),
    ),
  );
}
