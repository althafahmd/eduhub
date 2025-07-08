import '../networking/network_helper.dart';

const subjectApi = 'https://trogon.info/interview/php/api/subjects.php';

class SubjectModel {
  Future<dynamic> getSubject() async {
    NetworkHelper networkHelper = NetworkHelper(subjectApi);
    var subjectData = await networkHelper.getData();
    return subjectData;
  }
}
