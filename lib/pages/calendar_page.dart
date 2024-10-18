import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:seed_finder/providers/event_provider.dart';
import 'package:seed_finder/widgets/event_list_tile.dart';
import 'package:seed_finder/widgets/home_navigation_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends HookConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);
    final focusedDay = useState(DateTime.now());
    final selectedDay = useState(DateTime.now());
    final caledarFormat = useState(CalendarFormat.month);

    final months = List.generate(12, (index) {
      return DateFormat('MMMM').format(DateTime(0, index + 1)); // 1월 ~ 12월
    });

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // This now works
              },
            );
          },
        ),
        title: // DropdownButton for month selection
            DropdownButton<String>(
          value: DateFormat('MMMM').format(focusedDay.value),
          icon: const Icon(Icons.arrow_drop_down),
          underline: const SizedBox(),
          // Remove underline
          onChanged: (newMonth) {
            if (newMonth != null) {
              final newDate = DateTime(
                focusedDay.value.year,
                months.indexOf(newMonth) + 1,
                focusedDay.value.day,
              );
              focusedDay.value = newDate;
            }
          },
          items: months.map((month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Text(month),
            );
          }).toList(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 이벤트 추가
              focusedDay.value = DateTime.now();
            },
            icon: const Icon(Icons.today_rounded),
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // 이벤트 추가
              context.push("/favorite");
            },
          ),
          IconButton(
            onPressed: () {
              // 새로고침
              ref.invalidate(eventsProvider);
              //snackbar 출력
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refreshed'),
                ),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('month'),
              onTap: () {
                caledarFormat.value = CalendarFormat.month;
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('week'),
              onTap: () {
                caledarFormat.value = CalendarFormat.week;
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('two weeks'),
              onTap: () {
                caledarFormat.value = CalendarFormat.twoWeeks;
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: events.when(
        data: (events) {
          return Column(
            children: [
              TableCalendar(
                calendarFormat: caledarFormat.value,
                focusedDay: focusedDay.value,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay.value, day);
                },
                onDaySelected: (selected, focused) {
                  final format = DateFormat('yyyy-MM-dd');

                  focusedDay.value = format.parse(focused.toString());
                  selectedDay.value = format.parse(selected.toString());
                },
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                eventLoader: (day) {
                  return events[DateFormat('yyyy-MM-dd').format(day)] ?? [];
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: events[DateFormat('yyyy-MM-dd')
                              .format(selectedDay.value)]
                          ?.length ??
                      0,
                  itemBuilder: (context, index) {
                    final event = events[DateFormat('yyyy-MM-dd')
                        .format(selectedDay.value)]![index];
                    return EventListTile(event: event);
                  },
                ),
              ),
            ],
          );
        },
        error: (e, s) => const Center(
          child: Text("error"),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}
