import 'package:bloc/bloc.dart';
import 'package:flutter_video_calls/views/sign_up/cubit/sign_up_cubit.dart';

class IntroductionCubit extends Cubit<IntroductionState>{

  IntroductionCubit() : super(IntroductionInitial());

}
