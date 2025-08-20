import 'package:flutter/material.dart';

BottomNavigationBar navBar(BuildContext context){
  int index = 0;
  return BottomNavigationBar(items: const[
     BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
     BottomNavigationBarItem(icon: Icon(Icons.house), label: "Favourites"),
     BottomNavigationBarItem(icon: Icon(Icons.house), label: "Profile")
  ],
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  currentIndex: index,
  onTap: (value) =>{
   index = value
  },
  );
}