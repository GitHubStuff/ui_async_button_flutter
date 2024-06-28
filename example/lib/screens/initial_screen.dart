import 'dart:math';

import 'package:async_button_demo/gs/bloc/async_button_state.dart';
import 'package:async_button_demo/gs/models/cancellable_class.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../gs/widgets/async_button_widget.dart';
import '../widgets/spinning_image.dart';

class InitialScreen extends StatelessWidget {
  static const String route = '/InitialScreen';

  const InitialScreen({
    super.key,
    this.title = 'Initial Screen',
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: homeWidget(context),
      floatingActionButton: null,
    );
  }

  Widget homeWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                const snackBar = SnackBar(
                  content: Text('🤣 That Tickles!'),
                  duration: Duration(milliseconds: 500),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const LogoImage(size: Size(128, 128))),
          const Gap(30),
          AsyncButtonWidget(
            asyncAwaitWidget: const SpinngingImage(
              spinningWidget: EarImage(
                size: Size(128, 128),
              ),
            ),
            enabledWidget: const LogoImage(
              size: Size(128, 128),
            ),
            initialState: AsyncButtonState.enabled,
            disableCancel: false,
            task: CancellableClass(),
            taskState: (state) {
              debugPrint('🔵 Task State: $state');
            },
            size: const Size(64, 64),
          ),
        ],
      ),
    );
  }

  bool getRandomBoolean() {
    final random = Random();
    return random.nextBool();
  }
}
