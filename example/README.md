# MyAppName

- **LAST UPDATED 17-MAY-2024**

A complete, self-contained, **Flutter Demo App** that is the development view of an **App** for iOS, MacOS, Android, Windows, and Chrome review and updates.

## Getting Started

### Change out: *.vscode/launch.json*

The first time VSCode is made to run the ```/example``` app it creates a file: ```launch.json```

This config file controls which variation of the app to run.

Replace the content of this file with:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "dark mode",
            "request": "launch",
            "type": "dart",
            "program": "example/lib/main_dark.dart",
        },
        {
            "name": "light mode",
            "request": "launch",
            "type": "dart",
            "program": "example/lib/main_light.dart",
        },
        {
            "name": "device mode",
            "request": "launch",
            "type": "dart",
            "program": "example/lib/main_system.dart",
        }
    ]
}
```

This allows the demo app to run in Dark, Light, or System mode. ***This simple theme management is the least complicated way to test modes with little/no overhead from other packages***

### These are the steps when using VSCode

- Find/Replace `app_template` to name of the demo app (ex: `new_demo`) in the example pubspec.yaml
- Find/Replace `MyAppName` to a label used to name the app on mobile Platforms (ex:`My Spiffy Mobile App`), this changes up the Android and iOS app names.
- Find/Replace `macOSName` to the name of your macOS app (ex: `My Spiffy macOS App`), this changes up the MacOS name.
- Find/Replace `icodeforyou.com` to the project down for the product/customer (ex: `apple.com`), the domain is used in iOS and Windows.
- Find/Replace `com.icodeforyou` with the projects **reverse domain** that the start of the apps' identifier (ex: `com.apple`), used in iOS, Android, and Linux
- Find/Replace `bundleSuffix` with bundle id (ex: `my_spiffy_app`) **[using the folder name is ideal]**, this used for every platform.
- Find/Replace `AppleSuffix` for Apple bundles as iOS/MacOS do like '_'. **[ideal is folder name to lower-camel case (ex: `mySpiffyApp`)]**, used by iOS and MacOS

- The image `/assets/images/ltmm1024x1024.png` is a placeholder image to generate application icons. In the `pubspec.yaml` file is section marked *flutter_icons*:

  ```dart
  flutter_icons:
  android: 'launcher_icon'
  ios: true
  remove_alpha_ios: true
  image_path: 'assets/images/ltmm1024x1024.png'
  macos:
    generate: true
    image_path: 'assets/images/ltmm1024x1024.png'
  web:
    generate: true
    image_path: 'assets/images/ltmm1024x1024.png'
  windows:
    generate: true
    image_path: 'assets/images/ltmm1024x1024.png'

  ```

  This generates icons for the platforms by running from the *Terminal* in VSCode:

  ```sh
  % cd example
  % dart run flutter_launcher_icons
  % cd ..
  ```

  generating icons for iOS/Mac/Android/Web and even Windows *(Widows sucks but I guess someone has to do it.)*

  NOTE: The sample app already has the [ltmm1024x1024](assets/images/ltmm1024x1024.png). The best images are 1024x1024. Replace the image and make sure the `image_path` in `pubspec.yaml` is updated and re-run:

  `% dart run flutter_launcher_icons` again.

- From the Terminal in the IDE:

  ```sh
  % cd example
  % flutter clean
  % flutter pub get
  % dart run build_runner build -d
  % cd ios
  % pod install --repo-update
  % cd ../.. #should return package
  ```

The `build_runner` will generate `lib/gen/assets.gen.dart`, this is part of [flutter_gen_runner](https://pub.dev/packages/flutter_gen_runner), the flutter code generator for assets/fonts/colors to get rid of String-based APIs. Search `flutter_gen_runner` for an example of it's use.

All done, this is ideal first-commit for the new app.

## The demo app is ready

## For ***XCode*** errors

**Sometimes** the first attempt to run the demo will throw:

```md
code build done.                                            3.8s
Failed to build iOS app
Could not build the precompiled application for the device.
Error (Xcode): The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation.
2

Error launching application on 
```

the fix is to run from the VSCode Terminal:

```dart
% cd example/ios
% pod install
% cd ../..
```

## For ***macOS*** warnings

*IF* running ***macOS***, and there is a warning:

`The macOS deployment target 'MACOSX_DEPLOYMENT_TARGET' is set to 10.11, but the range of supported deployment target versions is 10.13 to 13.1.99. (in target 'FlutterMacOS' from project 'Pods')`

This is because *Launching/Running* an app the first time after *flutter pub get* generates serveral files that are **macOS** platform version 10.11

*WORKAROUND* Find/Replace `10.11` with `10.13` ![Only for macos path-ed files](/README/mac_os_deployment_target_workaround.png)

*NOTE* Make sure only ***macOS/*** pathed files are shown and replaced!!

### Summary of included files in /lib

- **main_dark.dart** the entry point into the demo for dark mode.
- **main_light.dart** the entry point into the demo for light mode.
- **main_system.dart** the entry point into the demo for system mode.

## Finally

Be kind to each other!
