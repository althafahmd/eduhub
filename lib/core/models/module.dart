import '../networking/network_helper.dart';

const moduleApi = 'https://trogon.info/interview/php/api/modules.php';

class ModuleModel {
  Future<dynamic> getModule(String subjectId) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$moduleApi?subject_id=$subjectId',
    );
    var moduleData = await networkHelper.getData();
    return moduleData;
  }
}
