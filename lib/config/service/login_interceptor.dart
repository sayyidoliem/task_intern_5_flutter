import 'package:task_intern_5_flutter/import.dart';

mixin LoginInterceptor {
  var option = BaseOptions(baseUrl: BaseUrl.url);

  Future<Dio> loginInterceptor() async {
    Dio dio = Dio(option);
    dio.interceptors.clear();
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
        error: true,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        print("CALL ON REQUEST");
        //kalau tidak kosong dapetin code dari Lokal/SharedPreferences
        final code = await UserStorage.getCode();
        if (code != null) {
          request.headers["code"] = code;
        }
        //kalau tidak kosong dapetin access token dari Lokal/SharedPreferences
        final accessToken = await TokenStorage.getToken();
        if (accessToken != null) {
          request.headers["Authorization"] = "Bearer $accessToken";
        }
        print("LEWAT");
        return handler.next(request);
      },
      onError: (error, handler) async {
        print("Stack trace Error: ${error.stackTrace}");
        if (error.response?.statusCode == 401 ||
            error.response?.statusCode == 400) {
          print(
              "ERROR : ${error.response?.statusCode} ${error.response?.statusMessage}");
          String newAccessToken = await refreshToken();

          error.requestOptions.headers["Authorization"] =
              "Bearer $newAccessToken";

          return handler.resolve(await dio.fetch(error.requestOptions));
        }
        return handler.next(error);
      },
    ));
    return dio;
  }

  Future<String> refreshToken() async {
    Dio dio = Dio(option);
    final refreshToken = await TokenStorage.getRefreshToken();

    //TODO Yg di dalam data yaitu refresh token bukan access token
    final response = await dio.post("/auth/refresh-token-mobile",
        data: {'refresh_token': refreshToken});

    final newAccessToken = response.data['data']['token'];
    final newRefreshToken = response.data['data']['refresh_token'];

    // TODO access token yg baru dan refresh token yg baru jgn lupa di simpan lg di TokenStorage

    try {
      if (response.data['message'] == "Berhasil Membuat Token Baru") {
        TokenStorage.saveToken(newAccessToken);
        TokenStorage.saveRefreshToken(newRefreshToken);
      }
    } on DioException catch (e) {
      print('Get Refresh Token Error ${e.toString()}');
    }
    return newRefreshToken;
  }
}