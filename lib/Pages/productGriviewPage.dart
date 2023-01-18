import 'package:api_crud_project/RestApi/restClient.dart';
import 'package:api_crud_project/Style/style.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool isLoading = true;


  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    isLoading = true;
    var data = await ProductGridViewListRequest();
    setState((){
      ProductList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product"),centerTitle: true,),
      body: Stack(
        children: [
          backGroundScreen(context),

        ],
      ),
    );
  }
}
