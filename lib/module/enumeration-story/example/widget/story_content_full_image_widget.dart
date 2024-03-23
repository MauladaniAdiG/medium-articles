import 'package:flutter/material.dart';

class StoryContentImageWidget extends StatelessWidget {
  final String content;
  const StoryContentImageWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        content,
        fit: BoxFit.cover,
      ),
    );
  }
}
