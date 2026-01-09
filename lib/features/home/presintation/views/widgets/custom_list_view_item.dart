import 'package:booklly/core/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3 / 3.6,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
          color: Colors.orange,
          image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
        ),
      ),
    );
  }
}
