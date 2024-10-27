part of 'show_video_cubit.dart';

@immutable
sealed class ShowVideoStates {}

final class ShowVideoInitial extends ShowVideoStates {}

final class ShowVideoSuccess extends ShowVideoStates {}

final class ShowVideoLoading extends ShowVideoStates {}

final class ShowVideoFailure extends ShowVideoStates {}
