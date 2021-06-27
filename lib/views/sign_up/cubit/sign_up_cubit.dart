import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class IntroductionCubit extends Cubit<IntroductionState>{

  IntroductionCubit() : super(IntroductionInitial());

}
