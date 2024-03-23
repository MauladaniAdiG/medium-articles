import 'package:flutter/material.dart';

class StoryContentGifWidget extends StatelessWidget {
  final String content;
  const StoryContentGifWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.network(
        content,
        fit: BoxFit.cover,
      ),
    );
  }
}
