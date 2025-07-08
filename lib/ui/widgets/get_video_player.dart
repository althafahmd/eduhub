import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetVideoPlayer extends StatefulWidget {
  final String url;
  final String type;

  const GetVideoPlayer({super.key, required this.url, required this.type});

  @override
  State<GetVideoPlayer> createState() => _GetVideoPlayerState();
}

class _GetVideoPlayerState extends State<GetVideoPlayer> {
  YoutubePlayerController? youtubeController;
  WebViewController? vimeoController;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  String? _extractVimeoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    for (final segment in uri.pathSegments.reversed) {
      if (int.tryParse(segment) != null) return segment;
    }
    return null;
  }

  void initializePlayer() async {
    try {
      if (widget.type == 'YouTube') {
        final videoId = YoutubePlayer.convertUrlToId(widget.url);
        if (videoId != null) {
          youtubeController = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(autoPlay: false),
          );
        } else {
          error = "Invalid YouTube URL";
        }
      } else if (widget.type == 'Vimeo') {
        final vimeoId = _extractVimeoId(widget.url);
        if (vimeoId != null) {
          final embedUrl = 'https://player.vimeo.com/video/$vimeoId';
          vimeoController = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse(embedUrl));
        } else {
          error = "Invalid Vimeo URL";
        }
      } else {
        error = "Unsupported video type: ${widget.type}";
      }
    } catch (e) {
      error = "Failed to load video: $e";
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  @override
  void didUpdateWidget(covariant GetVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url || oldWidget.type != widget.type) {
      youtubeController?.dispose();
      vimeoController = null;
      setState(() {
        isLoading = true;
        error = null;
      });
      initializePlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget playerWidget;

    if (isLoading) {
      playerWidget = const Center(child: CupertinoActivityIndicator());
    } else if (error != null) {
      playerWidget = Center(child: Text(error!));
    } else if (youtubeController != null) {
      playerWidget = YoutubePlayer(
        controller: youtubeController!,
        showVideoProgressIndicator: true,
      );
    } else if (vimeoController != null) {
      playerWidget = WebViewWidget(controller: vimeoController!);
    } else {
      playerWidget = const Center(child: Text("No video available."));
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: AspectRatio(aspectRatio: 16 / 9, child: playerWidget),
    );
  }

  void disposeControllers() {
    youtubeController?.dispose();
    youtubeController = null;
    vimeoController = null;
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
