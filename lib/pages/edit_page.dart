import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/post_model.dart';
import '../view_model/edit_viewmodel.dart';
import '../views/items_edit_post.dart';

class EditPage extends StatefulWidget {
  static const String id = "edit_page";
  Post post;
   EditPage({Key? key, required this.post }) : super(key: key);


  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  EditViewModel viewModel = EditViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<EditViewModel>(
          builder: (ctx, model, index) =>  itemEditPost(viewModel,context, widget.post),
        ),
      ),
    );
  }


}
