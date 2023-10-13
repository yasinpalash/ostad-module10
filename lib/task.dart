class Task {
  String details;
  String createdTime, updatedTime;
  String status;
  Task(
      {required this.details,
      required this.createdTime,
      required this.updatedTime,
      this.status = 'pending'});
}
