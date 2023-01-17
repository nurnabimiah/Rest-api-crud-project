
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';



const colorRed=Color.fromRGBO(231, 28, 36, 1);
const colorGreen=Color.fromRGBO(33, 191, 115, 1);
const colorWhite=Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue=Color.fromRGBO(44, 62, 80, 1);


// textformfiled decoration

InputDecoration AppInputDecoration(label){
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorGreen,width: 1)
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorWhite,width: 0)
      ),
      border: OutlineInputBorder(),
      labelText: label
  );
}



// background screen

 backGroundScreen(context){
  return SvgPicture.asset(
    'assets/images/background.svg',
     alignment: Alignment.center,
     height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,

  );
  
 }
 
 //app dropdown style 

DecoratedBox appDropdownStyle(child){
  return DecoratedBox(decoration: BoxDecoration(
    color: colorWhite,
    border: Border.all(color:colorWhite,width: 1),
    borderRadius: BorderRadius.circular(4)

  ),
    child: Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),

  );

}

//.........................
// ..........app btnStyle.........

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.all(0),
      primary: colorGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}




void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: Colors.white,
      fontSize: 16.0
  );

}
