part of 'story_bloc.dart';

sealed class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

final class StoryInitial extends StoryState {}

final class StoryStateDataLoading extends StoryState {}

final class StoryStateDataLoaded extends StoryState {}

final class StoryStateDataLoadedError extends StoryState {
  final String message;
  const StoryStateDataLoadedError({required this.message});
  @override
  List<Object> get props => [message];
}
