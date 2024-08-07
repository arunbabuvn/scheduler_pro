class Tasks {
  final String title;
  final String location;
  final String date;
  final String startTime;
  final String endTime;
  final String priority;
  final String description;

  Tasks({
    required this.title,
    required this.location,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
    required this.description,
  });

  factory Tasks.fromMap(Map<String, dynamic> doc) {
    return Tasks(
      title: doc['title'],
      location: doc['location'],
      date: doc['date'],
      startTime: doc['starttime'],
      endTime: doc['endtime'],
      priority: doc['priority'],
      description: doc['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'date': date,
      'starttime': startTime,
      'endtime': endTime,
      'priority': priority,
      'description': description,
    };
  }
}
