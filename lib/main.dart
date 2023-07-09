import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik/presentation/screen/discover/dicover_screen.dart';
import 'package:tok_tik/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepository =
        VideoPostsRepositoryImpl(videosDataSource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            //Operador de cascada ..loadNextPage()
            create: (_) =>
                DiscoverProvider(videoPostsRepository: videoPostsRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
