# Unity File Opener

Allows opening files in place on iOS and (someday) Android. It shares files using the standard share sheet, and they are edited in place (i.e. the file is still stored in your app's storage).

## Usage

There's a single `FileOpener.OpenInPlace` method to call. It returns a `bool` for whether the user opened the file.

The required first parameter is the path of the file to open. This can be a relative path under `Application.persistentDataPath` or an absolute path, but the file must be under `Application.persistentDataPath` to be able to be edited in place.

There is one optional parameter: `type` allows you to specify the file type if it's unable to be determined from the file extension. On iOS the `type` parameter must be a [UTI](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/understanding_utis/understand_utis_conc/understand_utis_conc.html). On Android the `type` parameter must be a [MIME type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types).

```c#
using OpenInPlace;

..

FileOpener.OpenInPlace(fileName);
```
