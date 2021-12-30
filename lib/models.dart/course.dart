
class Course{
  String? thName;
  String? enName;
  String? coursevalue;

  Course(this.thName, this.enName, this.coursevalue);

  static List<Course>getCourse() {
    return [
      Course('วิทยาการคอมพิวเตอร์', 'CS','1'),
    Course('เทคโนโลยีสารสนเทศ', 'IT','2'),
    ];
  }
}