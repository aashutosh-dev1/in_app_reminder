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
      InAppReminder.addReminder(
        title: 'Title for Reminder', // Title of the reminder
        notes: 'Notes for the reminder', // Optional notes// Set the reminder for 2 minutes from now
        frequency: ReminderFrequency.daily, // Change to weekly, monthly, or yearly as needed
      );
    } catch (e) {
      log('Error adding reminder: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: ElevatedButton(
            onPressed: addToReminder, // Add a reminder to the device's Reminders app.
            child: const Text("Add iOS Reminder"),
          ),
        ),
      ),
    );
  }
}
