class EventModel{
  final String title;
  final String subtitle;

  EventModel({ required this.title, required this.subtitle});
}

List<EventModel> allModel = [
  EventModel(
      title: 'Event Title1',
      subtitle: 'Event Subtitle1',
  ),
  EventModel(
    title: 'Event Title2',
    subtitle: 'Event Subtitle2',
  ),
  EventModel(
    title: 'Event Title3',
    subtitle: 'Event Subtitle3',
  ),
  EventModel(
    title: 'Event Title4',
    subtitle: 'Event Subtitle4',
  ),
];