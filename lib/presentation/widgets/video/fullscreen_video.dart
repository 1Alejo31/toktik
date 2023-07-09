import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video/gradient_video_background.dart';
import 'package:video_player/video_player.dart';
//Se debe de instalar las librerias de video_player y

class FullscreenVideo extends StatefulWidget {
  final String videoUrl;
  final String capton;

  const FullscreenVideo({
    super.key,
    required this.videoUrl,
    required this.capton,
  });

  @override
  State<FullscreenVideo> createState() => _FullscreenVideoState();
}

class _FullscreenVideoState extends State<FullscreenVideo> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(100)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    //se limpia la memoria
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(controller),
                  //Gradiente
                  GradientVideobackground(
                    stops: const [0.8, 1.0],
                  ),
                  //Texto
                  Positioned(
                      bottom: 50,
                      left: 20,
                      child: _VideoCaption(
                        caption: widget.capton,
                      ))
                ],
              ),
            ),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
