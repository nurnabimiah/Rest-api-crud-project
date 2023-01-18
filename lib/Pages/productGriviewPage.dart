import 'package:api_crud_project/Pages/productCreate_page.dart';
import 'package:api_crud_project/Pages/product_update_screen.dart';
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



  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Delete !') ,
            content: Text('Are sure you want to delete ?'),
            actions: [
              OutlinedButton(onPressed: ()
              async {
                Navigator.pop(context);
                setState((){
                  isLoading = true ;
                });
               await  ProductDeleteRequest(id);
               await CallData();
              },
                  child: Text('Yes')),
              OutlinedButton(onPressed: (){Navigator.pop(context);}, child: Text('No')),
            ],
          );
        }
    );

  }

  GotoUpdate(context, productItem){
    Navigator.push(context, MaterialPageRoute(builder: (builder) => ProductUpdateScreen(productItem)));

  }


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
          Container(
            child: isLoading?(Center(child: CircularProgressIndicator(),)):
           RefreshIndicator(
               child:  GridView.builder(
                   gridDelegate: ProductGridviewStyle(),
                   itemCount: ProductList.length,
                   itemBuilder: (context,index){
                     return Card(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.contain,)),
                           Container(
                             padding: EdgeInsets.fromLTRB(5,5,5,8),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(ProductList[index]['ProductName']),
                                 SizedBox(height: 7,),
                                 Text("Price : "+ProductList[index]['UnitPrice']+ " BDT"),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     OutlinedButton(
                                         onPressed: (){
                                           DeleteItem(ProductList[index]['_id']);
                                         },
                                         child: Icon(Icons.delete,size: 22,color: colorGreen)),

                                     SizedBox(width: 4,),

                                     OutlinedButton(
                                       onPressed: (){

                                         GotoUpdate(context,ProductList[index]);

                                       },
                                       child: Icon(Icons.edit,size: 22,color: colorGreen,),),

                                   ],
                                 )
                               ],
                             ),
                           )

                         ],
                       ),

                     );


                   }

               ),
               onRefresh: () async {
                await CallData();
               })
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (builder) => ProductCreatePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
