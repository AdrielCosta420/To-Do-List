// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tasks {
  String? uuid;
  String task;
  String? description;
  String? priority;
  DateTime? startDate;
  DateTime? endDate;
  bool check;
  Tasks({
    required this.task,
    this.uuid,
    this.description,
    this.priority,
    this.startDate,
    this.endDate,
    this.check = false
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'task': task,
      'description': description,
      'priority': priority,
      'startDate': startDate?.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
      'check' : check
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      task: map['task'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      priority: map['priority'] != null ? map['priority'] as String : null,
      startDate: map['startDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int)
          : null,
      endDate: map['endDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int)
          : null,
      check: map['check'] as bool,    
    );
  }

  Tasks copyWith({
    String? uuid,
    String? task,
    String? description,
    String? priority,
    DateTime? startDate,
    DateTime? endDate,
    bool? check,
  }) {
    return Tasks(
      uuid: uuid ?? this.uuid,
      task: task ?? this.task,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      check: check ?? this.check,
    );
  }
}
