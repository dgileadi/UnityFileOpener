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

## How it works

### iOS

On iOS it works by setting the `UIFileSharingEnabled` and `LSSupportsOpeningDocumentsInPlace` entries in your Info.plist file to `true` (see [this note for why](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/uid/TP40009252-SW20)). The Info.plist file is modified for you by BuildPostProcessor.cs in this package.

The `OpenInPlace` method then uses [UIDocumentInteractionController](https://developer.apple.com/documentation/uikit/uidocumentinteractioncontroller) to share the document.

### TODO: Android

Android is not yet implemented. Here are some notes on how I expect to implement it:

Use [FileProvider](https://developer.android.com/training/secure-file-sharing) and [ContentProvider](https://developer.android.com/guide/topics/providers/content-providers), see also [this SO answer](https://stackoverflow.com/questions/3883211/how-to-store-large-blobs-in-an-android-content-provider/4336013#4336013)

[This plugin](https://github.com/Mihail5412/Unity-Android-Files-Opener) seems to do it for Android.
