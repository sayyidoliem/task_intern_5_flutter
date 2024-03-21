import 'package:task_intern_5_flutter/import.dart';

class DashboardService implements DashboardRepositories {
  final dashboardUrl = '${BaseUrl.url}articles';

  @override
  Future<List<DashBoard>> getArticle() async {
    Dio dio = Dio();
    Response response = await dio.get(dashboardUrl);
    final responseData = response.data['articles'];
    print('Article Reponse Data: $responseData');
    List<DashBoard> listArticle = [];
    for (Map<String, dynamic> i in responseData) {
      listArticle.add(DashBoard.fromJson(i));
    }
    return listArticle;
  }
}
