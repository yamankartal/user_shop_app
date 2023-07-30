
import 'package:flutter/material.dart';



class Res{
  static double width=0;
  static double height=0;
  static double fullHeight=0;
  static double get font=>width*0.06;
  static double get  padding=>font/2;
  static double get  tinyFont=>font*0.1;
  static double get  tinyPadding=>padding*0.1;
}

void responsive(context){
  Res.width = MediaQuery.of(context).size.width;
  Res.fullHeight = MediaQuery.of(context).size.height;
  Res.height = Res.fullHeight -
      AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top;
}



