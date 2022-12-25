class TowIdModel {
  int? teacherId;
  int? studentId;

  TowIdModel({
    this.teacherId,
    this.studentId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['student_id'] = studentId;
    return data;
  }
}