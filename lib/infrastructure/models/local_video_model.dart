//toVideoEntity

import 'package:tok_tik/domain/entities/video_post.dart';

class LocalVodeoModel {
  //Constructor
  LocalVodeoModel(
      {required this.name,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  //Parametros de entrada
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  //Modelo json
  factory LocalVodeoModel.fromJson(Map<String, dynamic> json) =>
      LocalVodeoModel(
          name: json['name'] ?? 'No name',
          videoUrl: json['videoUrl'],
          likes: json['likes'] ?? 0,
          views: json['views'] ?? 0);
  Map<String, dynamic> toJson() =>
      {"name": name, "videoUrl": videoUrl, "likes": likes, "views": views};

  //convercion de datos
  VideoPost toVideoEntity() =>
      VideoPost(captoin: name, videoUrl: videoUrl, likes: likes, views: views);
}
