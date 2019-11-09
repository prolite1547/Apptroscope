import "package:flutter/material.dart";

class ImageBanner extends StatelessWidget{
  final String assetPath;
  final double height;

  ImageBanner({@required this.assetPath,this.height = 300.0});
  @override
  Widget build(BuildContext context) {
      return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          child: Image.asset(assetPath,fit: BoxFit.cover),
      );
  }
}