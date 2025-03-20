import 'dart:convert';

// Main Gita Model
class Gita {
  List<Chapter> chapters;

  Gita({required this.chapters});

  factory Gita.fromJson(String str) => Gita.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gita.fromMap(Map<String, dynamic> json) => Gita(
        chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toMap())),
      };
}

// Chapter Model
class Chapter {
  int id;
  String name;
  List<Shloka> slokas;

  Chapter({required this.id, required this.name, required this.slokas});

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        name: json["name"],
        slokas: List<Shloka>.from(json["slokas"].map((x) => Shloka.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slokas": List<dynamic>.from(slokas.map((x) => x.toMap())),
      };
}

// Shloka Model
class Shloka {
  int id;
  String sanskrit;
  String? meaning;
  String? translation;

  Shloka({required this.id, required this.sanskrit, this.meaning, this.translation});

  factory Shloka.fromMap(Map<String, dynamic> json) => Shloka(
        id: json["id"],
        sanskrit: json["sanskrit"],
        meaning: json["meaning"],
        translation: json["translation"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "sanskrit": sanskrit,
        "meaning": meaning,
        "translation": translation,
      };
}
