import 'package:flutter/services.dart';

enum ReminderFrequency { none, daily, weekly, monthly, yearly }

extension ReminderFrequencyExt on ReminderFrequency {
  String get name {
    switch (this) {
      case ReminderFrequency.daily:
        return 'daily';
      case ReminderFrequency.weekly:
        return 'weekly';
      case ReminderFrequency.monthly:
        return 'monthly';
      case ReminderFrequency.yearly:
        return 'yearly';
      default:
        return 'none';
    }
  }
}

class InAppReminder {
  static const MethodChannel _channel = MethodChannel('in_app_reminder');

  static Future<void> addReminder({
    required String title,
    String? notes,
    DateTime? dateTime,
    ReminderFrequency frequency = ReminderFrequency.none,
  }) async {
    final Map<String, dynamic> args = {
      'title': title,
      if (notes != null) 'notes': notes,
      if (dateTime != null) 'dateTime': dateTime.toUtc().toIso8601String(),
      if (frequency != ReminderFrequency.none) 'frequency': frequency.name,
    };
    await _channel.invokeMethod('addReminder', args);
  }
}
