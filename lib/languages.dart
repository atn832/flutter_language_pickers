import 'languages.g.dart';
export 'languages.g.dart';

class Language {
  const Language(this.isoCode, this.name, this.nativeName);

  final String name;
  final String isoCode;
  final String nativeName;

  Language.fromMap(Map<String, String> map)
      : name = map['name']!,
        isoCode = map['isoCode']!,
        nativeName = map['nativeName'] ?? map['name']!;

  /// Returns the Language matching the given ISO code from the standard list.
  factory Language.fromIsoCode(String isoCode) =>
      Languages.defaultLanguages.firstWhere((l) => l.isoCode == isoCode);

  bool operator ==(o) =>
      o is Language && name == o.name && isoCode == o.isoCode;

  @override
  int get hashCode => isoCode.hashCode;
}
