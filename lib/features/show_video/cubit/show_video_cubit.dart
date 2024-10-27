import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'show_video_state.dart';

class ShowVideoCubit extends Cubit<ShowVideoStates> {
  ShowVideoCubit() : super(ShowVideoInitial());

  late WebViewController controller;

  void showVideo(String urlVideo) {
    emit(ShowVideoLoading());
    try {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..loadHtmlString(urlVideo);
    emit(ShowVideoSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(ShowVideoFailure());
    }

  }
}
