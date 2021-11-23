using System;
using System.IO;
using System.Runtime.InteropServices;
using UnityEngine;

namespace OpenInPlace
{
    public class FileOpener
    {
        public static bool OpenInPlace(string path, string type = null)
        {
            // if relative, make absolute
            if (!Path.IsPathRooted(path))
                path = Path.Combine(Application.persistentDataPath, path);
            if (!File.Exists(path))
                return false;

            Uri fileUri = new Uri(new Uri("file://"), path);

#if UNITY_IOS && !UNITY_EDITOR
            return NativeOpenInPlace(fileUri.AbsoluteUri, type);
#elif UNITY_ANDROID
// TODO:
#elif UNITY_EDITOR
            try
            {
                Application.OpenURL(fileUri.AbsoluteUri);
                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
#endif
        }

#if UNITY_IOS && !UNITY_EDITOR
        [DllImport("__Internal", EntryPoint="UFO_OpenInPlace")]
        static extern bool NativeOpenInPlace(string url, string uti);
#endif
    }
}
