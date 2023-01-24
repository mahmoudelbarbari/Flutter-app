import 'package:flutter/material.dart';

class CommentDetails extends StatelessWidget {
  final String? uid;
  final senderName;
  final color;
  final text;
  const CommentDetails({
    Key? key,
    this.uid,
    this.color,
    this.senderName,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        color == const Color.fromARGB(255, 190, 68, 37)
            ? const Text(
                "Me",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            : Text(
                senderName,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Text(
            text == "" ? "" : text,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
