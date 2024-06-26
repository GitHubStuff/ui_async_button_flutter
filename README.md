# SETUP

- Find/Replace `package_template` to name of the name of the package (ex: `flutter_rocks`), using the folder the of the package is a good practice, but not an absolute.

- Follow the instructions in the **/example/README.md** to have the demo app show features of the package with a live demo for dark, light, and system themes.

- Address the *TODO:* in files in the **/example** folder by adding code from the package

<!--
The comments below are from the Flutter/Dart package generation. Feel free to use or ignore
-->

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).

Remove everything from here to the top
-->

# UIMarqueeWidget

A widget that display text like scrolling theatre marquee

## Install

```yaml
dev_dependencies:
  ui_marquee_flutter:
    git: https://github.com/GitHubStuff/ui_marquee_flutter.git
```

## Usage

```dart
import 'package:ui_marquee_flutter/ui_marquee_flutter.dart';
  :
  :

UIMarqueeWidget(
  message: message, // String - required
  forceScroll: true,  // Override scroll for short strings (default: false)
  rolloverPercentage: 0.3, // % (0.0 to 1.0) space before text rollsover (default: 0.1)
  scrollVelocityInPixelsPerSecond: speed, // double of rate of scroll (default: 60.0)
  pauseDuration: Duration(milliseconds: 875), // pause before redraw (default: 750ms)
  textStyle: TextStyle(fontSize: 28.0), // optional text style info (default: null)
);
```

## Example

```dart
UIMarqueeWidget(
              message: 'Short message',
              textStyle: TextStyle(fontSize: 28.0),
            ),
```

**NOTE** the ```/example``` app has usage/example

## Features

Text to long to fit on the screen/container will animate the text right to left.
If the text fits, there is no animation unless overridden.

## Getting started

```dart
UIMarqueeWidget(
    message: 'Some Long text, that might not fit',
    textStyle: TextStyle(fontSize: 28.0),
  ),
```

## Example App

For examples go to `/example` folder.

## Additional information

Widget declaration:

```dart
  /// Creates a [UIMarqueeWidget] widget with the specified [message] and [textStyle].
  ///
  /// The [message] parameter is required and represents the text to be displayed.
  ///
  /// The [forceScroll] parameter is optional and allows you to force the text to scroll
  ///
  /// The [pauseDuration] parameter is optional and allows you to customize the pause between scrolls
  ///
  /// The [rolloverPercentage] parameter is optional and allows you to customize the amount of rollover
  ///
  /// The [scrollVelocityInPixelsPerSecond] parameter is optional and allows you to customize the scroll velocity
  ///
  /// The [textStyle] parameter is optional and allows you to customize the text
  /// style of the message.
  const UIMarqueeWidget({
    super.key,
    required this.message,
    this.pauseDuration = _kPauseDuration,
    this.rolloverPercentage = _kRolloverPercentage,
    this.scrollVelocityInPixelsPerSecond = _kVelocity,
    this.textStyle,
    this.forceScroll = false,
  });
```

## Finally

Be kind to each other!
