import 'package:configuration/di/di_module.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_calls/views/sign_in/cubit/signin_cubit.dart';
import 'package:flutter_video_calls/views/sign_in/ui/signin_screen.dart';

class SignInRoute extends RouteDefine {
  static const ID = "Splash";

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => BlocProvider(
            create: (_) => getIt<SignInCubit>(),
            child: SignInScreen(),
          ),
        ),
      ];
}
