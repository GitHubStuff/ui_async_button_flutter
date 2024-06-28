import 'package:async_button_demo/gs/bloc/async_button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsyncButtonBloc extends Cubit<AsyncButtonState> {
  AsyncButtonBloc() : super(AsyncButtonState.initial);

  void updateState({required AsyncButtonState to}) async {
    if (state == AsyncButtonState.initial) {
      await Future.delayed(const Duration(milliseconds: 20));
    }
    emit(to);
  }
}
