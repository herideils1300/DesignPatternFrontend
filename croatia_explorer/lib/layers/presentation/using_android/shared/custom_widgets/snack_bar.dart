import 'package:flutter/material.dart';

class SnackBarWidget {
  static create(BuildContext context, String content) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      width: 380,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 69,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                child: Icon(Icons.info, size: 24, color: Theme.of(context).colorScheme.primary)),
            Text(content,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 3.0),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
