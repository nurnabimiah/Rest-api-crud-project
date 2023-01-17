

import 'dart:convert';
import 'package:api_crud_project/Style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> ProductCreateRequest(FormValues) async{

   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
   var PostBody = json.encode(FormValues);
   var PostHeader = {"Content-Type": "application/json"};

   
   var response =  await http.post(URL,headers: PostHeader,body: PostBody);//jotho khn porjonto shes na hobe onno line a jabe na
   var ResultCode = response.statusCode;
   var ResultBody = json.decode(response.body);

   if(ResultCode == 200  && ResultBody['status'] == "success"){
     SuccessToast('Request Success');
     return true;
   }
   else{
      ErrorToast('Request Fail Try Again');
      return false;
   }
}



ProductGridViewListRequest(){
   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");


}