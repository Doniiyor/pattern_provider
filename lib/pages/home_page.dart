import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../view_model/home_viewmodel.dart';
import '../views/iteam_of_post.dart';
import 'creat_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("setState"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<HomeViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                 viewModel.items.isEmpty ?
                     Center(child: Text("No Data",style: TextStyle(color: Colors.red),),):
                ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(viewModel, viewModel.items[index], context);
                  },
                ),
                viewModel.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
           // viewModel.items.isNotEmpty ?
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
              return CreatPage();
            }));

          },
          child: Icon(Icons.add),
        ));
  }
}
