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

## Issues and Contributions
If you encounter any issues or have suggestions for improvements, please open an issue on the [GitHub repository](https://github.com/aashutosh-dev1/in_app_reminder/issues).  
Contributions are welcome! Feel free to submit pull requests for bug fixes or enhancements.


## Future Development

* Android support is planned for a future release.
