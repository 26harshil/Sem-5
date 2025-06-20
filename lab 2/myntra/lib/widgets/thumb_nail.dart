import 'package:flutter/material.dart';

class ThumbNail extends StatefulWidget {
  final String imagepath;
  ThumbNail({super.key, required this.imagepath});

  @override
  State<ThumbNail> createState() => _ThumbNailState();
}

class _ThumbNailState extends State<ThumbNail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(widget.imagepath, fit: BoxFit.cover),
      ),
    );
  }
}
