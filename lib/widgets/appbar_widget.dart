import 'package:flutter/material.dart';
import 'main_color.dart';

basicAppBar({required BuildContext context, required String title}) {
  MainColor mainColor = MainColor();
  return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: mainColor.mainColor(),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ));
}
