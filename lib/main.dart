import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom Calender',
        theme: ThemeData.light(),
        home: const CustomCalender());
  }
}

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  //Seleecting of a date
  DateTime selectDate = DateTime.now();

//Check if date is selected
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Custom Calender"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Calender View"),
            const SizedBox(
              height: 10,
            ),
            _buildCalender(context)
          ],
        ),
      ),
    );
  }

  //Build the Custom Calender Widget

  Widget _buildCalender(BuildContext context) {
    //Generate first week Calender
    final List<DateTime> _dates = List.generate(360, (index) {
      DateTime now = DateTime.now();
      //This will return a Week date starting from now
      return DateTime(now.year, now.month, now.day + index);
    });
    return SizedBox(
      height: 130,
      //Using a ListView builder
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _dates.length,
          itemBuilder: (context, index) {
            // Getting every date and it's specific month and day
            DateTime date = _dates[index];
            String month = DateFormat.MMMM().format(date);
            String day = DateFormat.d().format(date);
            String dayOfMonth = DateFormat.E().format(date);
            bool isDateSelected = date == selectDate;
            return GestureDetector(
              onTap: () {
                setState(() {
                  isDateSelected = true;
                  selectDate = date;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    color: isDateSelected ? Colors.teal : Colors.teal[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      month,
                      style: TextStyle(
                          color: isDateSelected ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color:
                              isDateSelected ? Colors.teal[200] : Colors.teal,
                          borderRadius: BorderRadiusDirectional.circular(100)),
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                              color: isDateSelected
                                  ? Colors.white70
                                  : Colors.black,
                              fontSize: 24,
                              fontWeight: isDateSelected
                                  ? FontWeight.w900
                                  : FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      dayOfMonth,
                      style: TextStyle(
                          color: isDateSelected ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}


//Further Custom soon