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

/**
 *  {
    "id": "fA9QDwAAQBAJ",
    "title": "The Cucumber Book",
    "authors": [
    "Matt Wynne",
    "Aslak Hellesoy",
    "Steve Tooke"
    ],
    "description": "Your customers want rock-solid, bug-free software that does exactly what they expect it to do. Yet they can't always articulate their ideas clearly enough for you to turn them into code. You need Cucumber: a testing, communication, and requirements tool-all rolled into one. All the code in this book is updated for Cucumber 2.4, Rails 5, and RSpec 3.5. Express your customers' wild ideas as a set of clear, executable specifications that everyone on the team can read. Feed those examples into Cucumber and let it guide your development. Build just the right code to keep your customers happy. You can use Cucumber to test almost any system or any platform. Get started by using the core features of Cucumber and working with Cucumber's Gherkin DSL to describe-in plain language-the behavior your customers want from the system. Then write Ruby code that interprets those plain-language specifications and checks them against your application. Next, consolidate the knowledge you've gained with a worked example, where you'll learn more advanced Cucumber techniques, test asynchronous systems, and test systems that use a database. Recipes highlight some of the most difficult and commonly seen situations the authors have helped teams solve. With these patterns and techniques, test Ajax-heavy web applications with Capybara and Selenium, REST web services, Ruby on Rails applications, command-line applications, legacy applications, and more. Written by the creator of Cucumber and the co-founders of Cucumber Ltd., this authoritative guide will give you and your team all the knowledge you need to start using Cucumber with confidence. What You Need: Windows, Mac OS X (with XCode) or Linux, Ruby 1.9.2 and upwards, Cucumber 2.4, Rails 5, and RSpec 3.5",
    "genre": "[Computers]",
    "publishedDate": "2017-02-17"
    },
 */

class Book {
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.genre,
    required this.publishedDate,
  });

  late final String id;
  late final String title;
  late final List<String> authors;
  late final String description;
  late final String genre;
  late final String publishedDate;

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    authors = List<String>.from(json['authors']).map((e) => e).toList();
    description = json['description'];
    genre = json['genre'];
    publishedDate = json['publishedDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['authors'] = authors;
    _data['description'] = description;
    _data['genre'] = genre;
    _data['publishedDate'] = publishedDate;
    return _data;
  }
}

class BookDto {
  BookDto({
    required this.books,
  });

  late final List<Book> books;

  BookDto.fromJson(Map<String, dynamic> json) {
    books = List.from(json['books']).map((e) => Book.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['books'] = books.map((e) => e.toJson()).toList();
    return _data;
  }
}
