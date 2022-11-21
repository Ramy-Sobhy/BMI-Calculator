// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import '../../shared/component.dart';
import 'bmi_resulat.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
{


  bool isMale   = true;
  double height = 120;
  double weight = 90;
  int age       = 20;
  String device ='';
  String advice1 = 'normal';
  String advice2 = 'Over Weight';
  String advice3 = 'Very Over Weight';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.teal,
        elevation: 1,
        title:const Center(child: Text('BMI Calculator'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: defaultMaleAndFemale(
                      name: 'Male',
                      icon: Icons.male,
                      background: isMale ?Colors.teal:Colors.black12,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: defaultMaleAndFemale(
                      name: 'FeMale',
                      icon: Icons.female,
                      background: isMale ?Colors.black12:Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              defaultHeightAnWeight(
                titile: 'Height',
                body: '${height.round()}',
                unit: 'CM',
                value: height,
                width: double.infinity,
                min: 90,
                max: 230,
                function: (value){
                  setState(() {
                    height = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              Row(
                children: [

                  defalutAgeAndWeight(
                    head: 'Age',
                    body: '$age',
                    icon1: Icons.add,
                    icon2: Icons.remove,
                    OnPressedPlus: (){
                      setState(() {
                        age++;
                      });
                    },
                    OnPressedMinus: (){
                      setState(() {
                        age--;
                      });
                    },
                  ),
                  const Spacer(),
                  defaultHeightAnWeight(
                    titile: 'Weight',
                    fontsize: 30,
                    body: '${weight.round()}',
                    unit: 'KG',
                    value: weight,
                    width: 150,
                    max: 250,
                    min: 60,
                    function: (value){
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              defaultButton(
                text: 'calculate',
                onpress: (){
                  double result = weight / pow( height/100, 2);

                  if(result >=18.5  && result < 25){
                    device = advice1;
                  }else if(result >=25 && result <=30){
                    device = advice2;
                  }else{
                    device = advice3;
                  }
                  Navigator.push(context,MaterialPageRoute(
                    builder:(context) => BmiResult(
                      age: age,
                      isMale:isMale,
                      result: result.round(),
                      device: device,
                    ),
                  ),

                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}