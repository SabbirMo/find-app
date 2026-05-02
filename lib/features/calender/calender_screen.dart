import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 16),
              _buildToggleSwitch(),
              SizedBox(height: 10),
              TableCalendar(
                focusedDay: focusedDay,
                currentDay: focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime(2030, 12, 31),
                calendarFormat: calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,

                selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                onDaySelected: (day, fDay) {
                  setState(() {
                    selectedDay = day;
                    focusedDay = fDay;
                  });
                },
                headerVisible: false,
                daysOfWeekVisible: calendarFormat == CalendarFormat.month,
                calendarBuilders: CalendarBuilders(
                  prioritizedBuilder: (context, day, focusedDay) {
                    if (calendarFormat == CalendarFormat.week) {
                      return _buildWeekDayCard(
                        day,
                        isSameDay(day, selectedDay),
                      );
                    }
                    return null;
                  },

                  selectedBuilder: (context, day, focusedDay) {
                    if (calendarFormat == CalendarFormat.month) {
                      return _buildMonthSelectedDay(day);
                    }
                    return null;
                  },
                ),
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(color: Colors.transparent),
                  todayTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeekDayCard(DateTime day, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF914C63) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.black12,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('E').format(day)[0],
              style: TextStyle(
                color: isSelected ? Colors.white70 : Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${day.day}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelectedDay(DateTime date) {
    return Container(
      margin: const EdgeInsets.all(6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF914C63),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${date.day}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildToggleSwitch() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF5E6EB),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _toggleButton("Month", CalendarFormat.month),
            _toggleButton("Week", CalendarFormat.week),
          ],
        ),
      ),
    );
  }

  Widget _toggleButton(String title, CalendarFormat format) {
    final isSelected = calendarFormat == format;
    return GestureDetector(
      onTap: () {
        setState(() {
          calendarFormat = format;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFF914C63) : Colors.grey,
            fontFamily: 'Serif',
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  focusedDay = DateTime(focusedDay.year, focusedDay.month - 1);
                });
              },
              icon: Icon(Icons.chevron_left, size: 28),
            ),
            Text(
              DateFormat('MMMM yyyy').format(focusedDay),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  focusedDay = DateTime(focusedDay.year, focusedDay.month + 1);
                });
              },
              icon: Icon(Icons.chevron_right, size: 28),
            ),
          ],
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF5E6EB),
            foregroundColor: const Color(0xFF914C63),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            setState(() {
              focusedDay = DateTime.now();
              selectedDay = DateTime.now();
            });
          },
          child: Text(
            "Today",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Serif',
            ),
          ),
        ),
      ],
    );
  }
}
