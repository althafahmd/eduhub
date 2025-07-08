import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/get_video_player.dart';
import '../../core/models/video.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_typography.dart';

@RoutePage()
class VideoScreen extends StatefulWidget {
  final int moduleId;

  const VideoScreen({super.key, required this.moduleId});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  static List<dynamic> videos = [];
  bool isLoading = true;
  Map<String, dynamic>? selectedVideo;

  final VideoModel videoModel = VideoModel();

  @override
  void initState() {
    super.initState();
    fetchVideoData();
  }

  void fetchVideoData() async {
    try {
      var data = await videoModel.getVideo(widget.moduleId.toString());
      setState(() {
        videos = data ?? [];
        isLoading = false;
        if (videos.isNotEmpty) {
          selectedVideo = videos[0];
        }
      });
    } catch (e) {
      print('Error fetching videos: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: Icon(Icons.arrow_back, color: AppColors.primaryBlue),
        ),
        title: Text(
          'EduHub',
          style: AppTypography.headlineLarge.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : videos.isEmpty
            ? const Center(child: Text('No videos found!'))
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: selectedVideo == null
                          ? const Center(child: Text("No video selected"))
                          : GetVideoPlayer(
                              key: ValueKey(selectedVideo!['video_url']),
                              url: selectedVideo!['video_url'],
                              type: selectedVideo!['video_type'],
                            ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final video = videos[index];
                      return ListTile(
                        leading: Text(
                          video['id'].toString(),
                          style: AppTypography.labelLarge.copyWith(
                            color: AppColors.pureWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        title: Text(
                          video['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.headlineSmall.copyWith(
                            color: AppColors.pureWhite,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                        ),
                        subtitle: Text(
                          video['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.labelLarge.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              selectedVideo = video;
                            });
                          },
                          icon: const Icon(
                            Icons.play_circle_outline_rounded,
                            color: AppColors.pureWhite,
                          ),
                        ),
                      );
                    }, childCount: videos.length),
                  ),
                  SliverToBoxAdapter(
                    child: Gap(MediaQuery.paddingOf(context).bottom + 20),
                  ),
                ],
              ),
      ),
    );
  }
}
