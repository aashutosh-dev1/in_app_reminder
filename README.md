# In-App Reminder

A Flutter plugin for creating native reminders in the iOS Reminders app using `EventKit`.

This plugin allows Flutter applications to seamlessly integrate with the iOS Reminders app, enabling users to set reminders directly from within your app.

## Features

* **iOS Reminders Integration:** Create reminders that appear in the native iOS Reminders application.
* **Reminder Details:** Set a title and descriptive notes for each reminder.
* **Scheduled Alarms:** Specify a date and time for the reminder to trigger.
* **Recurrence Rules:** Configure reminders to repeat daily, weekly, monthly, or yearly.

## iOS Setup

To enable reminder functionality on iOS, you must include the `NSRemindersUsageDescription` key in your `ios/Runner/Info.plist` file. Provide a clear explanation for why your app requires access to the user's reminders.

```xml
<key>NSRemindersUsageDescription</key>
<string>This app needs access to your reminders to add new reminders directly from the app.</string>
```

## Platform Support

| Feature         | Supported      |
|-----------------|----------------|
| iOS Reminders   | ✅             |
| Android Support | ❌ Coming soon |

## Installation

Add `in_app_reminder` to your `pubspec.yaml` file:

```yaml
dependencies:
  in_app_reminder: ^0.0.4
```

Then, run `flutter pub get` to install the package.

## Future Development

* Android support is planned for a future release.
