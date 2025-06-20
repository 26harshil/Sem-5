import 'package:flutter/material.dart';

class SizeRow extends StatelessWidget {
  final String size;
  final VoidCallback onTap;
  final String? selectedSize;

  const SizeRow({
    super.key,
    required this.size,
    required this.onTap,
    this.selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedSize == size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: isSelected ? Colors.black : Colors.grey),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
