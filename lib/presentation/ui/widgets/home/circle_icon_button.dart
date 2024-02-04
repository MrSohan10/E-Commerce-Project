import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.ontap,
    required this.iconData,
  });

  final VoidCallback ontap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: ontap,
      child: CircleAvatar(
        // radius: 15,
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          iconData,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
