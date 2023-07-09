class VideoPost {
  final String captoin;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost(
      {required this.captoin,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});
}
