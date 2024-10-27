import 'package:blue_book/core/constants/constants.dart';
import 'package:blue_book/core/helpers/dio_helper.dart';
import 'package:blue_book/core/helpers/extentions.dart';
import 'package:blue_book/core/helpers/helper_methods.dart';
import 'package:blue_book/features/show_video/view/show_video_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/login_model.dart';
import '../models/show_video_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  final DioHelper dioHelper;
  LoginCubit(this.dioHelper) : super(LoginInitialState());

  late TextEditingController userNameController;
  late TextEditingController passwordController;

  Future<void> login() async {
    emit(LoginLoadingState());
    final modelToJson = LoginModel(
            userName: userNameController.text,
            password: passwordController.text)
        .toJson();

    final response = await dioHelper.post(
      endPoint: EndPoints.getStudentVideo,
      data: modelToJson,
    );
    final model = ShowVideoModel.fromJson(response.response!.data);

    if (model.success) {
      navigatorKey.currentContext!.push(const ShowVideoView());
      showMessage(message: "Login Successfull", isSuccess: true);
      emit(LoginSuccessState());
    } else {
      showMessage(message: "Invalid Username or Password", isSuccess: false);
      emit(LoginFailureState());
    }
  }
}
