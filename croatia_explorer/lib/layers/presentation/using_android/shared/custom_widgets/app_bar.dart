import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title) => AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      title: Text(title,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      shadowColor: Colors.grey,
      elevation: 1.5,
      toolbarHeight: 60,
    );

AppBar? switchNameAppBar(BuildContext context, int index){
  switch(index){
    case 0:{
      return appBar(context, "Places");
    }
    case 1:{
      return appBar(context, "Favourites");
    }
    case 2:{
      return null;
    }
  }

  throw Exception("The index is out of bounds.");
} 
