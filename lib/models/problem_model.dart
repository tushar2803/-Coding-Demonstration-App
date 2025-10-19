// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProblemModel {
  static List<Problem> problems = [];
}

class Problem {
  String? title;
  String? description;
  String? constraints;
  String? difficulty;
  Problem({
    this.title,
    this.description,
    this.constraints,
    this.difficulty,
  });

  Problem copyWith({
    String? title,
    String? description,
    String? constraints,
    String? difficulty,
  }) {
    return Problem(
      title: title ?? this.title,
      description: description ?? this.description,
      constraints: constraints ?? this.constraints,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'constraints': constraints,
      'difficulty': difficulty,
    };
  }

  factory Problem.fromMap(Map<String, dynamic> map) {
    return Problem(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      constraints:
          map['constraints'] != null ? map['constraints'] as String : null,
      difficulty:
          map['difficulty'] != null ? map['difficulty'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Problem.fromJson(String source) =>
      Problem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Problem(title: $title, description: $description, constraints: $constraints, difficulty: $difficulty)';
  }

  @override
  bool operator ==(covariant Problem other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.constraints == constraints &&
        other.difficulty == difficulty;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        constraints.hashCode ^
        difficulty.hashCode;
  }
}
