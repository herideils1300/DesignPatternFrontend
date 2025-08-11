import 'package:flutter/material.dart';

class Screen {
   BuildContext context;
   
   Screen(this.context);

   double calcualteWidth(){
    return context.size!.width;
   }

   double calculateHeight(){
    return context.size!.height;
   }
}