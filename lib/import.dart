//package
export 'package:flutter/material.dart';
export 'dart:convert';
export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:dio/dio.dart';
export 'package:pretty_dio_logger/pretty_dio_logger.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_secure_storage/flutter_secure_storage.dart';

//data
export 'package:task_intern_5_flutter/module/login/data/login_repositories.dart';

//service
export 'package:task_intern_5_flutter/module/login/application/login_service.dart';
export 'package:task_intern_5_flutter/module/dashboard/application/dashboard_service.dart';

//component
export 'package:task_intern_5_flutter/module/dashboard/presentation/component/card.dart';

//config
export 'package:task_intern_5_flutter/config/router/routes.dart';

//constant
export 'package:task_intern_5_flutter/config/constant/name_router.dart';
export 'package:task_intern_5_flutter/config/constant/api_path.dart';

//shareprefenced
export 'package:task_intern_5_flutter/sharepreference/storage.dart';

//repositories
export 'package:task_intern_5_flutter/module/dashboard/data/dashboard_repositories.dart';

//model
export 'package:task_intern_5_flutter/module/dashboard/domain/dashboard.dart';

//view
export 'package:task_intern_5_flutter/module/error/error_page.dart';
export 'package:task_intern_5_flutter/module/login/presentation/view/login_page.dart';
export 'package:task_intern_5_flutter/module/dashboard/presentation/view/dashboard_page.dart';
export 'package:task_intern_5_flutter/module/profile/presentation/view/profile_page.dart';

//viewmodel
export 'package:task_intern_5_flutter/module/dashboard/presentation/cubit/dashboard_cubit.dart';
