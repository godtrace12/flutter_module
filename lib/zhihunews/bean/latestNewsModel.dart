
class LatestNewsModel {
  String date;
  List<StoryModel> stories;
  List<TopStoryModel> topStories;

  LatestNewsModel(this.date, this.stories, this.topStories);

}

//手动序列化方式
class StoryModel{
  String title;
  String ga_prefix;
  List images;
  int type;
  int id;

  StoryModel(this.title, this.ga_prefix, this.images, this.type, this.id);
  StoryModel.fromJson(Map<String,dynamic> json)
  : title = json['title'],
    ga_prefix = json['ga_prefix'],
    images = json['images'],
    type = json['type'],
    id = json['id'];

  Map<String,dynamic> toJson() =>
      {
        'title':title,
        'ga_prefix':ga_prefix,
        'images':images,
        'type':type,
        'id':id,
      };
}

class TopStoryModel{
  String title;
  String ga_prefix;
  String image;
  int type;
  int id;

  TopStoryModel(this.title, this.ga_prefix, this.image, this.type, this.id);
  TopStoryModel.fromJson(Map<String,dynamic> json)
      : title = json['title'],
        ga_prefix = json['ga_prefix'],
        image = json['image'],
        type = json['type'],
        id = json['id'];

  Map<String,dynamic> toJson() =>
      {
        'title':title,
        'ga_prefix':ga_prefix,
        'image':image,
        'type':type,
        'id':id,
      };
}