import 'package:blue_book/core/helpers/dio_helper.dart';
import 'package:blue_book/features/auth/cubit/login_cubit.dart';
import 'package:kiwi/kiwi.dart';


void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerSingleton((container) => DioHelper());
  container.registerFactory((container) => LoginCubit(container.resolve<DioHelper>()));
}
