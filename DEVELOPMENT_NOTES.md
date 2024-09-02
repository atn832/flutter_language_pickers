# Development notes

## Regenerate languages

If you modify languages.json, you should regenerate the language constants in
languages.g.dart by reinitializing lib/languages.g.dart to:

```dart
import 'languages.dart';

class Languages {
  static List<Language> defaultLanguages = [];
}
```

Then running:

```bash
flutter pub pub run language_picker:build_languages
dart format lib/languages.g.dart
```
