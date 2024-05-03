class ContentsDto {
  ContentsDto({
    required this.contents,
  });

  late final List<Contents> contents;

  ContentsDto.fromJson(Map<String, dynamic> json) {
    contents =
        List.from(json['contents']).map((e) => Contents.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contents'] = contents.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Contents {
  Contents({
    required this.role,
    required this.parts,
  });

  late final String role;
  late final List<Parts> parts;

  Contents.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    parts = json['parts'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['role'] = role;
    _data['parts'] = parts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Role {
  Role({
    required this.text,
  });

  late final String text;

  Role.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    return _data;
  }
}

class Parts {
  Parts({
    required this.text,
  });

  late final String text;

  Parts.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    return _data;
  }
}

class ResponseDto {
  ResponseDto({
    required this.candidates,
  });

  late final List<Candidates> candidates;

  ResponseDto.fromJson(Map<String, dynamic> json) {
    candidates = List.from(json['candidates'])
        .map((e) => Candidates.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['candidates'] = candidates.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Candidates {
  Candidates({
    required this.content,
    required this.finishReason,
    required this.index,
    required this.safetyRatings,
  });

  late final Content content;
  late final String finishReason;
  late final int index;
  late final List<SafetyRatings> safetyRatings;

  Candidates.fromJson(Map<String, dynamic> json) {
    content = Content.fromJson(json['content']);
    finishReason = json['finishReason'];
    index = json['index'];
    safetyRatings = List.from(json['safetyRatings'])
        .map((e) => SafetyRatings.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.toJson();
    _data['finishReason'] = finishReason;
    _data['index'] = index;
    _data['safetyRatings'] = safetyRatings.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Content {
  Content({
    required this.parts,
    required this.role,
  });

  late final List<Parts> parts;
  late final String role;

  Content.fromJson(Map<String, dynamic> json) {
    parts = List.from(json['parts']).map((e) => Parts.fromJson(e)).toList();
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['parts'] = parts.map((e) => e.toJson()).toList();
    _data['role'] = role;
    return _data;
  }
}

class SafetyRatings {
  SafetyRatings({
    required this.category,
    required this.probability,
  });

  late final String category;
  late final String probability;

  SafetyRatings.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['probability'] = probability;
    return _data;
  }
}