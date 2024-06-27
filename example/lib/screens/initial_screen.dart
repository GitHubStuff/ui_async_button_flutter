import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:ui_async_button_flutter/ui_async_button_flutter.dart';

import '../widgets/spinning_ear.dart';

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
            child: const EarSpinner(),
          ),
          const Gap(15.0),
        ],
      ),
    );
  }
}
