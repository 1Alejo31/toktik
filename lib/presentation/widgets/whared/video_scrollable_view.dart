import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/video/fullscreen_video.dart';
import 'package:tok_tik/presentation/widgets/whared/video_player/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    //PageView, es un widget q permite realizar scroll de pantalla completa
    return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          // ignore: non_constant_identifier_names
          final VideoPost = videos[index];

          return Stack(
            children: [
              //video player + gradient

              SizedBox.expand(
                child: FullscreenVideo(
                  capton: VideoPost.captoin,
                  videoUrl: VideoPost.videoUrl,
                ),
              ),

              //botones
              Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(video: VideoPost),
              ),
            ],
          );
        });
  }
}
