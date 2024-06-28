import 'package:async_button_demo/gs/bloc/async_button_bloc.dart';
import 'package:async_button_demo/gs/bloc/async_button_state.dart';
import 'package:async_button_demo/gs/models/cancellable_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef AsyncButtonStateCallback = Function(AsyncButtonState state);

class AsyncButtonWidget extends StatelessWidget {
  final AsyncButtonState initialState;
  final bool disableCancel;
  final AsyncButtonStateCallback taskState;
  final CancellableTask task;
  final Size size;
  final Widget asyncAwaitWidget;
  final Widget enabledWidget;
  final Widget? disabledWidget;

  const AsyncButtonWidget({
    super.key,
    required this.asyncAwaitWidget,
    required this.enabledWidget,
    required this.taskState,
    required this.task,
    this.disabledWidget,
    this.disableCancel = true,
    this.initialState = AsyncButtonState.enabled,
    this.size = const Size(64, 64),
  }) : assert(initialState == AsyncButtonState.disabled ||
            initialState == AsyncButtonState.enabled);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AsyncButtonBloc(),
      child: BlocBuilder<AsyncButtonBloc, AsyncButtonState>(
        buildWhen: (previous, current) => (previous != current),
        builder: (context, state) {
          switch (state) {
            case AsyncButtonState.cancel:
              _handleCancel();
              taskState(AsyncButtonState.cancel);
              return _buildEnabled(context);
            case AsyncButtonState.disabled:
              return _buildDisabled(context);
            case AsyncButtonState.enabled:
              return _buildEnabled(context);
            case AsyncButtonState.failure:
            case AsyncButtonState.initial:
              return _buildInitial(context);
            case AsyncButtonState.running:
              return _buildRunning(context);
            case AsyncButtonState.success:
              _handleSuccess(context);
              return _buildEnabled(context);
          }
        },
      ),
    );
  }

  void _handleCancel() {
    task.cancel();
    taskState(AsyncButtonState.cancel);
  }

  void _handleSuccess(BuildContext context) =>
      context.read<AsyncButtonBloc>().updateState(to: AsyncButtonState.success);

  Widget _buildDisabled(BuildContext context) {
    context.read<AsyncButtonBloc>().updateState(to: AsyncButtonState.disabled);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: disabledWidget ?? Opacity(opacity: 0.4, child: enabledWidget),
    );
  }

  Widget _buildEnabled(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: GestureDetector(
        onTap: () {
          context
              .read<AsyncButtonBloc>()
              .updateState(to: AsyncButtonState.running);
          task.startTask().then((result) {
            context.read<AsyncButtonBloc>().updateState(to: result);
            taskState(result);
          });
        },
        child: enabledWidget,
      ),
    );
  }

  Widget _buildInitial(BuildContext context) =>
      (initialState == AsyncButtonState.disabled)
          ? _buildDisabled(context)
          : _buildEnabled(context);

  Widget _buildRunning(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: GestureDetector(
        onLongPress: disableCancel
            ? null
            : () => context
                .read<AsyncButtonBloc>()
                .updateState(to: AsyncButtonState.cancel),
        child: asyncAwaitWidget,
      ),
    );
  }
}
