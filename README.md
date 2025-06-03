# in_app_reminder

Flutter verson: 3.29.2

A Flutter plugin for adding native reminders to the iOS Reminders app using `EventKit`.

- ✅ Set title and notes
- ✅ Add date and time
- ✅ Set daily, weekly, monthly, or yearly repeat
- ❌ Android support: coming soon

---

## ⚠️ iOS Setup Required

To run this plugin on iOS, you **must** add the following to your `ios/Runner/Info.plist` file:

```xml
<key>NSRemindersUsageDescription</key>
<string>Your usage description</string>
```

---

## ✨ Features

| Feature             | Supported |
|---------------------|-----------|
| iOS Reminders       | ✅        |
| Repeat options      | ✅        |
| Time-based alarm    | ✅        |
| Android support     | ❌ Coming soon |

---

## Installation

```yaml
dependencies:
  in_app_reminder: ^0.0.3
