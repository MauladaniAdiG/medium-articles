enum StoryType {
  FREE_TEXT,
  IMAGE,
  GIF,
  UNDEFINED,
}

extension StoryTypeExt on StoryType {
  bool get isFreeText => this == StoryType.FREE_TEXT;

  bool get isImage => this == StoryType.IMAGE;

  int get type {
    switch (this) {
      case StoryType.FREE_TEXT:
        return 1;
      case StoryType.IMAGE:
        return 7;
      case StoryType.GIF:
        return 6;
      default:
        return -1;
    }
  }

// will used when you parsing json
  static StoryType fromInt(int? val) {
    return StoryType.values.firstWhere(
      (element) => element.type == val,
      orElse: () => StoryType.UNDEFINED,
    );
  }
}
