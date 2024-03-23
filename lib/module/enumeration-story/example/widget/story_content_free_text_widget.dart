import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryContentFreeTextWidget extends StatelessWidget {
  final String content;
  const StoryContentFreeTextWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: GoogleFonts.rocknRollOne(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        height: 1.8,
      ),
    );
  }
}
