

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
     //SuccessToast('Request Success');
     return true;
   }
   else{
      ErrorToast('Request Fail Try Again');
      return false;
   }
}



Future<List> ProductGridViewListRequest() async {
   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
   var PostHeader = {"Content-Type": "application/json"};
   var response = await http.get(URL,headers: PostHeader,);

   var ResultCode = response.statusCode;
   var ResultBody = json.decode(response.body);

   if(ResultCode == 200  && ResultBody['status'] == "success"){
      SuccessToast('Request Success');
      return ResultBody['data'];
   }
   else{
      ErrorToast('Request Fail Try Again');
      return [];
   }

}


Future<bool> ProductDeleteRequest (id) async{
   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
   var PostHeader = {"Content-Type": "application/json"};
   var response = await http.get(URL,headers: PostHeader);
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



//product update api


Future<bool> ProductUpdateRequest(FormValues,id) async{

   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
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

