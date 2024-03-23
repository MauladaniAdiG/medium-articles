import 'package:app/module/enumeration-story/example/constant/story_type.dart';
import 'package:app/module/enumeration-story/example/bloc/story_bloc.dart';
import 'package:app/module/enumeration-story/example/model/story_model.dart';
import 'package:app/module/enumeration-story/example/widget/story_content_free_text_widget.dart';
import 'package:app/module/enumeration-story/example/widget/story_content_full_image_widget.dart';
import 'package:app/module/enumeration-story/example/widget/story_content_gif_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late StoryBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = StoryBloc();
    _bloc.add(StoryEventLoadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<StoryBloc, StoryState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is StoryStateDataLoadedError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: GoogleFonts.rocknRollOne(
                    fontSize: 14.0,
                  ),
                ),
              ),
            );
          }
        },
        buildWhen: (_, current) =>
            current is StoryStateDataLoaded || current is StoryStateDataLoading,
        builder: (context, state) {
          if (state is StoryStateDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView.builder(
            itemCount: _bloc.storyList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              final storyModel = _bloc.storyList[i];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 14.0),
                child: Stack(
                  children: [
                    _buildContentByStoryType(storyModel: storyModel),
                    Positioned(
                      bottom: 20.0,
                      left: 14.0,
                      right: 14.0,
                      child: _contentCreator(storyModel: storyModel),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
          ),
        ),
        title: Text(
          'A.',
          style: GoogleFonts.monoton(
            fontSize: 38.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContentByStoryType({required StoryModel storyModel}) {
    if (storyModel.type == StoryType.FREE_TEXT) {
      return StoryContentFreeTextWidget(content: storyModel.content);
    } else if (storyModel.type == StoryType.IMAGE) {
      return StoryContentImageWidget(content: storyModel.content);
    } else if (storyModel.type == StoryType.GIF) {
      return StoryContentGifWidget(content: storyModel.content);
    }
    return const SizedBox.shrink();
  }

  Widget _contentCreator({required StoryModel storyModel}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xff98ABEE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 26.0,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storyModel.user?.name ?? '',
                    style: GoogleFonts.rocknRollOne(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    storyModel.user?.alias ?? '',
                    style: GoogleFonts.rocknRollOne(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Icon(
            Icons.favorite,
            size: 32.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
