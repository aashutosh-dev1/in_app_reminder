import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:in_app_reminder/in_app_reminder.dart';
import 'package:in_app_reminder/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Add a reminder to the device's Reminders app.
  ///
  /// [title] is the title of the reminder.
  /// [notes] is the notes of the reminder.
  /// [dateTime] is the date and time of the reminder.
  /// [frequency] is the frequency of the reminder.
  Future<void> addToReminder() async {
    try {
      final success = await InAppReminder.addReminder(
        title: 'Title for Reminder',
        notes: 'Notes for the reminder',
        frequency: ReminderFrequency.daily,
      );
      if (success) {
        log('Reminder added successfully');
      } else {
        log('Failed to add reminder');
      }
    } catch (e) {
      log('Error adding reminder: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('In-App Reminder Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: addToReminder,
            child: const Text("Add iOS Reminder"),
          ),
        ),
      ),
    );
  }
}
