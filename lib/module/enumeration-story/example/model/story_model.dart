import 'package:app/module/enumeration-story/example/constant/story_type.dart';

class StoryModel {
  StoryType type;
  String content;
  StoryCreator? user;
  StoryModel({
    this.type = StoryType.UNDEFINED,
    this.content = '',
    this.user,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      type: StoryTypeExt.fromInt(json['type']),
      content: json['content'] ?? '',
      user: StoryCreator.fromJson(json['user'] ?? {}),
    );
  }

  static List<StoryModel> fromList(Map<String, dynamic> json) {
    final rawList = json['data'] as List?;
    return rawList?.map((e) => StoryModel.fromJson(e)).toList() ?? [];
  }
}

class StoryCreator {
  String name;
  String alias;
  StoryCreator({
    this.name = '',
    this.alias = '',
  });

  factory StoryCreator.fromJson(Map<String, dynamic> json) {
    return StoryCreator(
      name: json['name'] ?? '',
      alias: json['alias'] ?? '',
    );
  }
}
