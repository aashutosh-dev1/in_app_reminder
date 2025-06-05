

import 'package:flutter/services.dart';
import 'package:in_app_reminder/utils.dart';

class InAppReminder {
  /// Private constructor to prevent instantiation.
  InAppReminder._();

  /// Singleton instance of the InAppReminder class.
  static final InAppReminder _instance = InAppReminder._();

  /// Singleton instance of the InAppReminder class.
  static InAppReminder get instance => _instance;

  // Method channel for communication with the native iOS code
  static const MethodChannel _channel = MethodChannel('in_app_reminder');

  /// Add a reminder to the device's Reminders app.
  ///
  /// [title] is the title of the reminder.
  /// [notes] is the notes of the reminder.
  /// [dateTime] is the date and time of the reminder.
  /// [frequency] is the frequency of the reminder.
  static Future<void> addReminder({
    required String title,
    String? notes,
    DateTime? dateTime,
    ReminderFrequency frequency = ReminderFrequency.none,
  }) async {
    final Map<String, dynamic> args = {
      'title': title,
      if (notes != null) 'notes': notes, // Optional notes
      if (dateTime != null) 'dateTime': dateTime.toUtc().toIso8601String(), // Set the reminder for 2 minutes from now
      if (frequency != ReminderFrequency.none) 'frequency': frequency.name, // Change to weekly, monthly, or yearly as needed
    };
    await _channel.invokeMethod('addReminder', args); // Invoke the native method to add the reminder
  }
}
