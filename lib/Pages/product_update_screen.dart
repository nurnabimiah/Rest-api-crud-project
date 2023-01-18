
import 'package:api_crud_project/Pages/productGriviewPage.dart';
import 'package:api_crud_project/RestApi/restClient.dart';
import 'package:flutter/material.dart';

import '../Style/style.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
   ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };
  bool loading = false;

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  //for update

  @override
  void initState() {

    setState(() {
      FormValues.update("Img", (value) => widget.productItem["Img"]);
      FormValues.update("ProductCode", (value) => widget.productItem["ProductCode"]);
      FormValues.update("ProductName", (value) => widget.productItem["ProductName"]);
      FormValues.update("Qty", (value) => widget.productItem["Qty"]);
      FormValues.update("TotalPrice", (value) =>widget.productItem["TotalPrice"]);
      FormValues.update("UnitPrice", (value) => widget.productItem["UnitPrice"]);

    });


  }

  FormOnSubmit() async {
    if(FormValues["Img"]!.length ==0){
      ErrorToast('Image link Required !');
    }
    else if(FormValues["ProductCode"]!.length ==0){
      ErrorToast('Product Code Required !');
    }
    else if(FormValues["ProductName"]!.length ==0){
      ErrorToast('Product Name Required !');
    }
    else if(FormValues["Qty"]!.length ==0){
      ErrorToast('Product Quantity Required !');
    }
    else if(FormValues["TotalPrice"]!.length ==0){
      ErrorToast('Product total Price  Required !');
    }
    else if(FormValues["UnitPrice"]!.length ==0){
      ErrorToast('Product Unit Price Required !');
    }

    else{
      setState((){
        loading = true;
      });
      await ProductUpdateRequest(FormValues,widget.productItem['_id']);
      
      Navigator.pushAndRemoveUntil
        (context,
          MaterialPageRoute(builder: (context)=> ProductGridViewScreen() )
          , (route) => false);

      setState((){
        loading = false;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product',),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          backGroundScreen(context),
          Container(
            child: loading?(Center(child: CircularProgressIndicator(),)):
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [

                  //..............productName..............
                  TextFormField(
                    initialValue: FormValues['ProductName'],
                    onChanged: (TextValue) {InputOnChange("ProductName", TextValue);},
                    decoration: AppInputDecoration('Product Name'),
                  ),

                  SizedBox(
                    height: 20,
                  ),


                  //..............productCode..............
                  TextFormField(
                      initialValue: FormValues['ProductCode'],
                      onChanged: (TextValue) {InputOnChange( "ProductCode", TextValue);},
                      decoration: AppInputDecoration('Product Code')),
                  SizedBox(
                    height: 20,
                  ),


                  //..............productImage..............


                  TextFormField(
                      initialValue: FormValues['Img'],
                      onChanged: (TextValue) {InputOnChange("Img", TextValue);},
                      decoration: AppInputDecoration('Product Image')),
                  SizedBox(
                    height: 20,
                  ),


                  //..............productUnitPrice..............

                  TextFormField(
                      initialValue: FormValues['UnitPrice'],
                      onChanged: (TextValue) {InputOnChange("UnitPrice", TextValue);},
                      decoration: AppInputDecoration('Unit Price')),
                  SizedBox(
                    height: 20,
                  ),

                  //..............totalPrice..............

                  TextFormField(
                      initialValue: FormValues['TotalPrice'],
                      onChanged: (TextValue) {InputOnChange("TotalPrice", TextValue);},
                      decoration: AppInputDecoration('Total Price')),
                  SizedBox(
                    height: 20,
                  ),



                  //..............dropdownButton..............


                  appDropdownStyle(DropdownButton(
                    value: FormValues['Qty'],
                    items: [
                      DropdownMenuItem(
                        child: Text('Select Qt'),
                        value: '',
                      ),
                      DropdownMenuItem(
                        child: Text('1 pcs'),
                        value: '1 pcs',
                      ),
                      DropdownMenuItem(
                        child: Text('2 pcs'),
                        value: '2 pcs',
                      ),
                      DropdownMenuItem(
                        child: Text('3 pcs'),
                        value: '3 pcs',
                      ),
                      DropdownMenuItem(
                        child: Text('4 pcs'),
                        value: '4 pcs',
                      ),
                    ],
                    onChanged: (TextValue) {InputOnChange("Qty", TextValue);},
                    isExpanded: true,
                    underline: Container(),
                  )),
                  SizedBox(
                    height: 20,
                  ),




                  //........submit button..........

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        FormOnSubmit();
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
