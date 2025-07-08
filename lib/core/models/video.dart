import '../networking/network_helper.dart';

const videoApi = 'https://trogon.info/interview/php/api/videos.php';

class VideoModel {
  Future<dynamic> getVideo(String moduleId) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$videoApi?module_id=$moduleId',
    );
    var videoData = await networkHelper.getData();
    return videoData;
  }
}
