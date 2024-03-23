import 'package:app/module/enumeration-story/example/model/story_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc() : super(StoryInitial()) {
    on<StoryEventLoadData>(_mapLoadDataStory);
  }

  List<StoryModel> storyList = [];

  void _mapLoadDataStory(
    StoryEventLoadData event,
    Emitter<StoryState> emit,
  ) {
    try {
      emit(StoryStateDataLoading());
      final mapResponse = {
        'status': 'OK',
        'data': [
          {
            'type': 1,
            'content': '''
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
                ''',
            'user': {'name': 'Alpha', 'alias': '@alpha'}
          },
          {
            'type': 7,
            'content':
                'https://images.unsplash.com/photo-1505968409348-bd000797c92e?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'user': {'name': 'Beta', 'alias': '@Beta'}
          },
          {
            'type': 6,
            'content':
                'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ3ZvOWc0Nm9jZWIxanRtcmF6bmxmMHNpMnY5MndreGx6bjVkam0wbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/goDiN1ikcfN1H82ko9/giphy.gif',
            'user': {'name': 'Gamma', 'alias': '@Gamma'}
          }
        ],
      };
      storyList = StoryModel.fromList(mapResponse);
      emit(StoryStateDataLoaded());
    } catch (_) {
      emit(const StoryStateDataLoadedError(message: 'error'));
    }
  }
}
