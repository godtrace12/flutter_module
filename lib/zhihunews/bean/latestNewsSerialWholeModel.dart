import 'package:json_annotation/json_annotation.dart';

part 'latestNewsSerialWholeModel.g.dart';
@JsonSerializable()

class LatestNewsSerialWholeModel {
  String date;
  List<StorySerialWholeModel> stories;
  List<TopStorySerialWholeModel> top_stories;

  LatestNewsSerialWholeModel(this.date, this.stories, this.top_stories);
  factory LatestNewsSerialWholeModel.fromJson(Map<String, dynamic> json) => _$LatestNewsSerialWholeModelFromJson(json);
  Map<String, dynamic> toJson() => _$LatestNewsSerialWholeModelToJson(this);
}


@JsonSerializable()
class TopStorySerialWholeModel{
  String title;
  String ga_prefix;
  String image;
  int type;
  int id;

  TopStorySerialWholeModel(this.title, this.ga_prefix, this.image, this.type, this.id);

  factory TopStorySerialWholeModel.fromJson(Map<String, dynamic> json) => _$TopStorySerialWholeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopStorySerialWholeModelToJson(this);
}


@JsonSerializable()
class StorySerialWholeModel{
  String title;
  String ga_prefix;
  List images;
  int type;
  int id;

  StorySerialWholeModel(this.title, this.ga_prefix, this.images, this.type, this.id);

  factory StorySerialWholeModel.fromJson(Map<String, dynamic> json) => _$StorySerialWholeModelFromJson(json);
  Map<String, dynamic> toJson() => _$StorySerialWholeModelToJson(this);
}