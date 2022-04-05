import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../view_model/creat_viewmodel.dart';
import '../views/iteam_of_creatpost.dart';

class CreatPage extends StatefulWidget {
  static const String id = "edit_page";
  const CreatPage({Key? key}) : super(key: key);


  @override
  State<CreatPage> createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  CreatViewModel viewModel = CreatViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CreatViewModel>(
          builder: (ctx, model, index) =>  iteamCreatPost(viewModel,context),
        ),
      ),
    );
  }


}
