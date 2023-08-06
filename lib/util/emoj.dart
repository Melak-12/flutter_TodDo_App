import 'package:flutter/material.dart';

class Emoj extends StatelessWidget {
  final String Emojs;
  const Emoj({
    super.key,
    required this.Emojs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[500],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(13),
      child: Text(
        Emojs,
        style: const TextStyle(color: Colors.yellow),
      ),
    );
  }
}
