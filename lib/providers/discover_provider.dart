import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostsRepository,
  });

  Future<void> loadNextPage() async {
    //Simulacion de comunicacion http

    await Future.delayed(const Duration(seconds: 2));

    //Carga los videos
    /*final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVodeoModel.fromJson(video).toVideoEntity())
        .toList();
    */
    //final List<VideoPost> newVideos = videoPosts
    //    .map((video) => VideoPost(
    //        captoin: video['name'],
    //        videoUrl: video['videoUrl'],
    //        likes: video['likes'],
    //        views: video['views']))
    //    .toList();

    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);

    //todo: cargar videos
    initialLoading = false;

    notifyListeners();
  }
}
