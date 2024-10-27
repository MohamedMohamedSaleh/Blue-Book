import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_video_cubit_state.dart';

class ShowVideoCubitCubit extends Cubit<ShowVideoCubitState> {
  ShowVideoCubitCubit() : super(ShowVideoCubitInitial());
}
