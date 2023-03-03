# widget_kit

A small library for interfacing with the _very_ limited parts of [WidgetKit] that are accessible through platform channels. API based on [flutter_widgetkit]. iOS and macOS only.

## Introduction

The only parts of [WidgetKit] that can be accessed through Flutter are the following methods:

| Method | Parameters | Description |
|:----------:|:-------------:|:------|
| reloadTimelines | ofKind | Reloads the timelines for all widgets of a particular kind. The `ofKind` parameter is an identifier that matches the value you used when creating the widget's configuration.
| reloadAllTimelines | | Reloads the timelines for all configured widgets belonging to the containing app. |

This means that this library is **_not_ for creating widget user interfaces**. This library facilitates some interaction with [WidgetKit] timelines and basic means for passing arbitrary data to the underlying platform via [UserDefaults] and app groups. Retrieving that data and applying it to a Widget UI has to be done on the platform level; this is _not_ possible through Flutter.

[WidgetKit]: https://developer.apple.com/documentation/widgetkit/
[flutter_widgetkit]: https://github.com/fasky-software/flutter_widgetkit
[UserDefaults]: https://developer.apple.com/documentation/foundation/userdefaults

## Usage

### [UserDefaults]

```dart
import 'package:widget_kit/widget_kit.dart';

void foo() {
  // Save some data to user preferences.
  await UserDefaults.setString('key', 'value', 'group.tv.gameflow');

  // Check if key is present.
  await UserDefaults.contains('key'); // true

  // Retrieve (typed) value.
  await UserDefaults.getString('key'); // 'value'

  // Remove pair.
  await UserDefaults.remove('key'); // true
}
```

### [WidgetKit]

```dart
WidgetKit.reloadAllTimelines();
WidgetKit.reloadTimelines('foo');
```
