# language_picker

[![pub package](https://img.shields.io/pub/v/language_picker.svg)](https://pub.dartlang.org/packages/language_picker)
[![unit-tests](https://github.com/atn832/language_picker/actions/workflows/unit-tests.yaml/badge.svg)](https://github.com/atn832/language_picker/actions/workflows/unit-tests.yaml)

Provides a dropdown and dialog to select a language.

Originally made by [@gomgom](https://github.com/gomgom) at https://pub.dev/packages/language_pickers. As of May 2021, this project has had no activity for more than a year and does not compile anymore. So I am shamelessly republishing it. :) I've also improved the API and fixed a few issues along the way.

![](art/example.gif)

## Getting Started

### Finding languages

* by name: `Languages.korean`
* by ISO code: `Language.fromIsoCode('fr')`
* preset languages: `Languages.defaultLanguages`

### Minimal example

This will use the default builder and default list of languages.

```dart
LanguagePickerDropdown(
  onValuePicked: (Language language) {
    print(language.name);
  })
```

### Preselect a value

```dart
LanguagePickerDropdown(
  initialValue: Languages.korean,
  onValuePicked: (Language language) {
    print(language.name);
  })
```

### Customize rendering

If you don't want to display the ISO code:

```dart
LanguagePickerDropdown(
  itemBuilder: languageBuilder,
  onValuePicked: (Language language) {
    print(language.name);
  })

...

// Just render the name.
final languageBuilder = (language) => Text(language.name);
```

You can also use `language.nativeName`.

### Customize the list of languages

```dart
LanguagePickerDropdown(
  languages: supportedLanguages,
  onValuePicked: (Language language) {
    print(language.name);
  })

...

final supportedLanguages = [
  Languages.english,
  Languages.french,
  Languages.japanese,
  Languages.korean,
];
```

### Programmatically change the selected language

```dart
// Pre-selected language is French.
final controller = LanguagePickerDropdownController(Languages.french);
final picker = LanguagePickerDropdown(
  controller: controller,
  languages: [Languages.english, Languages.french, Languages.norwegian],
);

// In some other method: Force it to switch to Norwegian.
controller.value = Languages.norwegian;
```

### LanguagePickerDropdown example

```dart
import 'package:language_picker/language.dart';
import 'package:language_picker/language_picker.dart';

Language _selectedDropdownLanguage = Languages.korean;

// It's sample code of Dropdown Item.
Widget _buildDropdownItem(Language language) {
  return Row(
    children: <Widget>[
      SizedBox(
        width: 8.0,
      ),
      Text("${language.name} (${language.isoCode})"),
    ],
  );
}


// Builder
LanguagePickerDropdown(
  initialValue: Languages.korean,
  itemBuilder: _buildDropdownItem,
  onValuePicked: (Language language) {
    _selectedDropdownLanguage = language;
    print(_selectedDropdownLanguage.name);
    print(_selectedDropdownLanguage.isoCode);
  },
),
```

### LanguagePickerDialog example

```dart
import 'package:language_picker/language.dart';
import 'package:language_picker/language_picker.dart';

Language _selectedDialogLanguage = Languages.korean;

// It's sample code of Dialog Item.
Widget _buildDialogItem(Language language) => Row(
    children: <Widget>[
      Text(language.name),
      SizedBox(width: 8.0),
      Flexible(child: Text("(${language.isoCode})"))
    ],
  );

void _openLanguagePickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: LanguagePickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your language'),
            onValuePicked: (Language language) => setState(() {
                  _selectedDialogLanguage = language;
                  print(_selectedDialogLanguage.name);
                  print(_selectedDialogLanguage.isoCode);
                }),
            itemBuilder: _buildDialogItem)),
  );
```

### LanguagePickerCupertino example

```dart
import 'package:language_picker/language.dart';
import 'package:language_picker/language_picker.dart';

Language _selectedCupertinoLanguage = Languages.korean;

// It's sample code of Cupertino Item.
void _openCupertinoLanguagePicker() => showCupertinoModalPopup<void>(
  context: context,
  builder: (BuildContext context) {
    return LanguagePickerCupertino(
      pickerSheetHeight: 200.0,
      onValuePicked: (Language language) => setState(() {
            _selectedCupertinoLanguage = language;
            print(_selectedCupertinoLanguage.name);
            print(_selectedCupertinoLanguage.isoCode);
          }),
    );
  });

Widget _buildCupertinoItem(Language language) => Row(
    children: <Widget>[
      Text("+${language.name}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(language.name))
    ],
  );
```
