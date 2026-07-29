import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProductionCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const ProductionCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: TableCalendar(
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2035, 12, 31),
          focusedDay: focusedDay,

          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },

          onDaySelected: onDaySelected,

          calendarFormat: CalendarFormat.month,

          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),

          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.orange.shade300,
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: Color(0xFF0D47A1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
