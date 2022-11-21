
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


Widget defaultMaleAndFemale({
 double width = 150,
  double height =150,
  required IconData icon,
  required String name,
  Color background = Colors.white,
}) =>Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.tealAccent,
          width: 2,
        )
    ),
    child:Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
           Icon(
            icon,
            size: 70,
          ),
          const SizedBox(height: 10,),
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),

          ),
        ],
      ),
    ),
);



Widget defalutAgeAndWeight({
  double width = 150,
  double height = 180,
  required String head,
  required String body,
  required IconData icon1,
  required IconData icon2,
  required Function OnPressedPlus,
  required Function OnPressedMinus,
}) =>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.tealAccent,
        width: 2,
      )
  ),
  child: Padding(
    padding: const EdgeInsets.only(
      top: 10,
    ),
    child: Column(
      children: [
         Text(
          head,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
        const SizedBox(height: 15,),
         Text(
          body,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35
          ),
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 45,
              child: FloatingActionButton(
                heroTag:'plus_button',
                onPressed: (){
                  OnPressedPlus();
                },
                backgroundColor: Colors.teal,
                child: Icon(
                  icon1,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20,),
            SizedBox(
              width: 50,
              height: 45,
              child: FloatingActionButton(
                heroTag: 'minus_button',
                onPressed: (){
                  OnPressedMinus();
                },
                backgroundColor: Colors.teal,
                child:  Icon(
                  icon2,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);



Widget defaultHeightAnWeight({
  double width = 150,
  double height = 180,
  required String titile,
  required String body,
  required String unit,
  required Function function,
  required double value,
  required double min,
  required double max,
  double fontsize =30,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.tealAccent,
        width: 2,
      )
  ),
  child: Padding(
    padding: const EdgeInsets.only(
      top: 20,
    ),
    child: Column(
      children: [
        Text(
          titile,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: fontsize,
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children:  [
            Text(
              body,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              unit,
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Slider(
          min: min,
          max: max,
          value:value,
          onChanged:(value){
            function(value);
          } ,
          activeColor: Colors.teal,

        ),
      ],
    ),
  ),
);



Widget defaultButton({
  double width = double.infinity,
  double height  = 40,
  Color background = Colors.white,
  required String text,
  required Function onpress,
  Color textcolor = Colors.teal,
  double radius = 15,
  double fontsize = 20,
  Color borderColor = Colors.tealAccent,
})=> Container(
  width:width,
  height: height,
  decoration: BoxDecoration(
    borderRadius:  BorderRadius.circular(radius),
    border: Border.all(
      color:borderColor,
    ),
    color: background,
  ),
  child: MaterialButton(
    onPressed:(){
      onpress();
    },
    child:Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: fontsize,
        color: textcolor,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);







Widget defaultFormField({
  required TextEditingController controller ,
  required TextInputType type,
  required String lable,
  required IconData prefix,
  IconData ? suffix,
  bool obsecure=false,
  Function ?onpress,
  required FormFieldValidator validator,
  double radius = 15,
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: obsecure,

  decoration: InputDecoration(

    label: Text(lable),
    labelStyle: const TextStyle(
      color: Colors.teal,
      //fontWeight: FontWeight.bold,
    ),
    focusColor: Colors.black,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(
        color:Colors.teal,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
      ),
      borderRadius: BorderRadius.circular(radius),

    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(
        color: Colors.teal,
        width: 1,
      ),
    ),
    prefixIcon:Icon
      (
      prefix,
      color: Colors.black,
    ),
    suffixIcon:IconButton(
      onPressed: (){
        onpress!();
      },
      icon: Icon(
        suffix,
        color: Colors.black,
      ),
    ),
  ),
  validator:validator,
);