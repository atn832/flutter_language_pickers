## 0.4.4

Fixed deprecated TextStyles. Thank you [sczesla](https://github.com/sczesla) and [https://github.com/AhmedOs90](AhmedOs90)!

## 0.4.3

Fixed bug when Language was being used as a Key in a Set or Map.

## 0.4.2

Implemented LanguagePickerDropdownController.

## 0.4.1

Restored finding a language by ISO code as `Language.fromIsoCode(isoCode)`.

## 0.4.0

Breaking changes:

- Replaced `LanguagePickerUtils.getLanguageByIsoCode(isoCode)` by `Languages.languageName`.
- Replaced `List<Map<String, String>> defaultLanguagesList` by `List<Language> Languages.defaultLanguages`.
- Replaced LanguagePickerDropdown's `String? initialValue` parameter by `Language? initialValue`.
- Replaced LanguagePickerDialog and LanguerPickerCupertino's `List<Map<String, String>>? languagesList` parameter by `List<Language>> languages`.

Other:

- Implemented the `Language.==` operator.
- Removed duplicate Norwegian language.

## 0.3.0+1

Documented usage example.

## 0.3.0

- Rename the library to to language_picker.
- Fixed LanguagePickerDropdown's layout to render well with Flex, eg when two of them are laid out in a Row.
- Changed LanguagePickerDropdown's `List<Map<String, String>> languagesList` to `List<Language> languages`.
- Introduced `Map<String, Language> defaultLanguageMap` and `List<Language> defaultLanguages`.
- Removed duplicate English language from the default list.
- Removed dates from Greek and Occitan, eg "Greek, Modern (1453-)" to "Greek".
- Migrated to null safety. Thank you [spsarolkar](https://github.com/spsarolkar)!

See the original package's prior changes at https://pub.dev/packages/language_pickers/changelog.
