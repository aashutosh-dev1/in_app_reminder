import Flutter
import UIKit
import EventKit


public class InAppReminderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "in_app_reminder", binaryMessenger: registrar.messenger())
    let instance = InAppReminderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "addReminder",
          let args = call.arguments as? [String: Any],
          let title = args["title"] as? String else {
      result(FlutterError(code: "INVALID_ARGUMENT", message: "Missing or invalid title", details: nil))
      return
    }
    let notes = args["notes"] as? String
    let dateTimeString = args["dateTime"] as? String
    let frequencyString = args["frequency"] as? String
    let eventStore = EKEventStore()

    eventStore.requestAccess(to: .reminder) { _, error in
      if let error = error {
        result(FlutterError(code: "PERMISSION_ERROR", message: error.localizedDescription, details: nil))
        return
      }

      let reminder = EKReminder(eventStore: eventStore)
      reminder.title = title
      reminder.notes = notes
      reminder.calendar = eventStore.defaultCalendarForNewReminders()

      if let dateTimeString = dateTimeString {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions.insert(.withFractionalSeconds)

        if let isoDate = isoFormatter.date(from: dateTimeString) {
          let calendar = Calendar.current
          let components = calendar.dateComponents(in: TimeZone.current, from: isoDate)

          var dueDate = DateComponents()
          dueDate.calendar = calendar
          dueDate.timeZone = TimeZone.current
          dueDate.year = components.year
          dueDate.month = components.month
          dueDate.day = components.day
          dueDate.hour = components.hour
          dueDate.minute = components.minute
          dueDate.second = components.second

          reminder.dueDateComponents = dueDate
          reminder.addAlarm(EKAlarm(absoluteDate: isoDate))

          if let frequencyString = frequencyString {
            let frequency: EKRecurrenceFrequency?
            switch frequencyString {
              case "daily": frequency = .daily
              case "weekly": frequency = .weekly
              case "monthly": frequency = .monthly
              case "yearly": frequency = .yearly
              default: frequency = nil
            }

            if let frequency = frequency {
              let rule = EKRecurrenceRule(recurrenceWith: frequency, interval: 1, end: nil)
              reminder.addRecurrenceRule(rule)
            }
          }
        } else {
          result(FlutterError(code: "INVALID_DATE_FORMAT", message: "Invalid dateTime format", details: nil))
          return
        }
      }

      do {
        try eventStore.save(reminder, commit: true)
        result("Reminder added")
      } catch {
        result(FlutterError(code: "SAVE_ERROR", message: error.localizedDescription, details: nil))
      }
    }
  }
}