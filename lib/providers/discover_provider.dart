import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infrastructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //Simulacion de comunicacion http

    await Future.delayed(const Duration(seconds: 2));

    //Carga los videos
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVodeoModel.fromJson(video).toVideoEntity())
        .toList();

    //final List<VideoPost> newVideos = videoPosts
    //    .map((video) => VideoPost(
    //        captoin: video['name'],
    //        videoUrl: video['videoUrl'],
    //        likes: video['likes'],
    //        views: video['views']))
    //    .toList();

    videos.addAll(newVideos);

    //todo: cargar videos
    initialLoading = false;

    notifyListeners();
  }
}
