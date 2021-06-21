import 'package:bloc/bloc.dart';

import 'signin_state.dart';

class SignInCubit extends Cubit<SignInState>{

  SignInCubit() : super(SignInInitial());

}
