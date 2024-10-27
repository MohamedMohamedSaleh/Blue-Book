import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../cubit/show_video_cubit.dart';

class ShowVideoView extends StatefulWidget {
  const ShowVideoView({super.key, required this.urlVideo});
  final String urlVideo;
  @override
  State<ShowVideoView> createState() => _ShowVideoViewState();
}

class _ShowVideoViewState extends State<ShowVideoView> {
  final cubit = KiwiContainer().resolve<ShowVideoCubit>();
  @override
  void initState() {
    cubit.showVideo(widget.urlVideo);
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          
        ),

        title: const Text("Your Video"),
      ),
      //  webview_flutter
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is ShowVideoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: WebViewWidget(
              controller: cubit.controller,
            ),
          );
        },
      ),
    );
  }
}
