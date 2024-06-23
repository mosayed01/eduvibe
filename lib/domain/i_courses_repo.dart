import '../data/remote/dto.dart';

abstract class ICoursesRepo {
  Future<List<Course>> getCourses();
  Future<Course> getCourse(String id);

  Future<List<StudyStrategy>> getStudyStrategies();
}