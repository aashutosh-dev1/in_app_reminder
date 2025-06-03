import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:in_app_reminder/in_app_reminder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> addToReminder() async {
    try {
      InAppReminder.addReminder(
        title: 'Title for Reminder', // Title of the reminder
        notes: 'Notes for the reminder', // Optional notes
        dateTime: DateTime.now().add(const Duration(minutes: 2)), // Set the reminder for 2 minutes from now
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
            onPressed: addToReminder,
            child: const Text("Add iOS Reminder"),
          ),
        ),
      ),
    );
  }
}
