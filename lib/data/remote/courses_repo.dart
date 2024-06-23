import 'package:dio/dio.dart';
import 'package:eduvibe/data/remote/dto.dart';
import 'package:flutter/cupertino.dart';

import '../../core/utils.dart';
import '../../domain/i_courses_repo.dart';

class CoursesRepo implements ICoursesRepo {
  final Dio _dio;

  CoursesRepo(this._dio);

  @override
  Future<List<Course>> getCourses() async {
    try {
      final response = await _dio.get(APIConstants.courses);
      if (response.statusCode == 200) {
        List<Course> coursesDto = response.data != null
            ? List.from(response.data).map((e) => Course.fromJson(e)).toList()
            : [];
        return coursesDto;
      } else {
        throw Exception("Failed to load courses");
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Course> getCourse(String id) async {
    try {
      final response = await _dio.get("${APIConstants.courses}/$id");
      if (response.statusCode == 200) {
        return Course.fromJson(response.data);
      } else {
        throw Exception("Failed to load course");
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<StudyStrategy>> getStudyStrategies() async {
    try{
      final response = await _dio.get(APIConstants.strategies);
      if (response.statusCode == 200) {
        List<StudyStrategy> studyStrategiesDto = response.data != null
            ? List.from(response.data).map((e) => StudyStrategy.fromJson(e)).toList()
            : [];
        return studyStrategiesDto;
      } else {
        throw Exception("Failed to load study strategies");
      }
    } catch (e) {
      throw e;
    }
  }
}
