import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.teal,
                      behavior: SnackBarBehavior.floating,
                      width: 200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Hello Mukund"),
                      ),
                    ),
                  );
                },
                child: Text("Show Snackbar")),
            SizedBox(
              height: 20,
            ),
            Text(
              '${dateTime.day}/${dateTime.month}/${dateTime.year}',
              textScaleFactor: 2,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: dateTime,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2025));

                  if (newDate != null) {
                    setState(() {
                      dateTime = newDate;
                    });
                  }
                },
                child: Text("Choose Date")),
            SizedBox(
              height: 20,
            ),
            Text(
              '${timeOfDay.hour}:${timeOfDay.minute}',
              textScaleFactor: 2,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final newTime = await showTimePicker(
                    context: context, initialTime: timeOfDay);

                if (newTime != null) {
                  setState(() {
                    timeOfDay = newTime;
                  });
                }
              },
              child: Text("Choose Time"),
            )
          ],
        ),
      ),
    );
  }
}