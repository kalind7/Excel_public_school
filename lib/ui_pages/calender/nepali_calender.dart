import 'package:flutter/material.dart' hide CalendarDatePicker;
import 'package:get/get.dart';

import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:new_project_work/controller/event/table_event_controller.dart';
import 'package:new_project_work/event_model.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/simmer/calendar_shimmer.dart';

class CalendarDatePickerWidget extends StatefulWidget {
  @override
  State<CalendarDatePickerWidget> createState() =>
      _CalendarDatePickerWidgetState();
}

class _CalendarDatePickerWidgetState extends State<CalendarDatePickerWidget> {
  final tableEventController = Get.put(TableEventController());

  final ValueNotifier<NepaliDateTime> _selectedDate =
  ValueNotifier(NepaliDateTime.now());

  late List<Datum> event;

  /// Events
  // final List<Event> events = [
  //   Event(date: DateTime.now(), eventTitles: ['Today 1', 'Today 2']),
  //   Event(
  //       date: DateTime.now().add(Duration(days: 10)),
  //       eventTitles: ['Holiday 1', 'Holiday 2']),
  //   Event(
  //       date: DateTime.now().subtract(Duration(days: 5)),
  //       eventTitles: ['Event 1', 'Event 2']),
  //   Event(
  //       date: DateTime.now().add(Duration(days: 8)),
  //       eventTitles: ['Seminar 1', 'Seminar 2']),
  // ];

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => tableEventController.isloading.value
    //       ? CalendarShimmer()
    //       :
    return Column(
      children: [
        CalendarDatePicker(
          onDisplayedMonthChanged: (date) {
            // _selectedDate.value = date;
            // var english = date.toDateTime();
            // log(english.year.toString());
            // log(english.month.toString());
            tableEventController.getEventNepali(
                date.toDateTime().year, date.toDateTime().month);
          },
          initialDate: NepaliDateTime.now(),
          firstDate: NepaliDateTime(2078),
          lastDate: NepaliDateTime(2079),
          onDateChanged: (date) => _selectedDate.value = date,
          dayBuilder: (dayToBuild) {
            return Obx(
                  () => Stack(
                children: <Widget>[
                  Center(
                    child: Text(
                      NepaliUtils().language == Language.nepali
                          ? '${dayToBuild.day}'
                          : NepaliUnicode.convert('${dayToBuild.day}'),
                      style: TextStyle(
                          color: dayToBuild.weekday == 07
                              ? Colors.red
                              : Colors.black),
                    ),
                  ),
                  if (tableEventController.eventNepali.any((event) =>
                      _dayEquals(
                          event.fromDate.toNepaliDateTime(), dayToBuild)))
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.purple),
                      ),
                    )
                ],
              ),
            );
          },
          selectedDayDecoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
            shape: BoxShape.circle,
          ),
        ),
        Obx(
              () => Expanded(
            child: tableEventController.isloading.value
                ? CalendarShimmer()
                : ValueListenableBuilder<NepaliDateTime>(
              valueListenable: _selectedDate,
              builder: (context, date, _) {
                try {
                  event = tableEventController.eventNepali
                      .where((e) =>
                      _dayEquals(e.fromDate.toNepaliDateTime(), date))
                      .toList();
                } on StateError {
                  event = [];
                }

                if (event.isEmpty) {
                  return Center(
                    child: Text('No Events'),
                  );
                }

                return ListView.builder(
                  itemCount: event.length,
                  itemBuilder: (context, index) {
                    var myitem = event[index];
                    return ListTile(
                      leading: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 38,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5.0),
                                    color: pink,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        NepaliDateFormat(
                                            'd', Language.nepali)
                                            .format(myitem.fromDate
                                            .toNepaliDateTime())
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto'),
                                      ),
                                      Text(
                                        NepaliDateFormat(
                                            'MMMM', Language.nepali)
                                            .format(myitem.fromDate
                                            .toNepaliDateTime())
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto'),
                                      ),
                                    ],
                                  )),
                              Text(
                                NepaliDateFormat('EEE', Language.nepali)
                                    .format(myitem.fromDate
                                    .toNepaliDateTime())
                                    .toString(),
                                // myitem.fromDate.weekday.toString(),
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontFamily: 'Roboto'),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                            height: 40,
                            child: VerticalDivider(
                              width: 4,
                              thickness: 4,
                              color: pink,
                            ),
                          ),
                        ],
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          myitem.eventTitle,
                          style: TextStyle(
                              fontSize: 18,
                              color: pink,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          myitem.eventDes,
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              color: pink,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                  // separatorBuilder: (context, _) => Divider(),
                );
              },
            ),
          ),
        ),
      ],
      // ),
    );
  }

  bool _dayEquals(NepaliDateTime? a, NepaliDateTime? b) =>
      a != null &&
          b != null &&
          a.toIso8601String().substring(0, 10) ==
              b.toIso8601String().substring(0, 10);
}

///
class TodayWidget extends StatelessWidget {
  ///
  final NepaliDateTime today;

  ///
  const TodayWidget({
    Key? key,
    required this.today,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  NepaliDateFormat.EEEE()
                      .format(today)
                      .substring(0, 3)
                      .toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            Text(
              NepaliDateFormat.d().format(today),
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}