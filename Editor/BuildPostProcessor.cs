using System.IO;
using UnityEngine;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;

// Copied from https://stackoverflow.com/questions/54370336/from-unity-to-ios-how-to-perfectly-automate-frameworks-settings-and-plist/54370793#54370793
public class BuildPostProcessor
{
    [PostProcessBuild]
    public static void ChangeXcodePlist(BuildTarget buildTarget, string path)
    {
        if (buildTarget == BuildTarget.iOS)
        {
            string plistPath = path + "/Info.plist";
            PlistDocument plist = new PlistDocument();
            plist.ReadFromFile(plistPath);

            PlistElementDict rootDict = plist.root;

            Debug.Log(">> Automation, plist ... <<");

            rootDict.SetBoolean("UIFileSharingEnabled", true);
            rootDict.SetBoolean("LSSupportsOpeningDocumentsInPlace", true);

            File.WriteAllText(plistPath, plist.WriteToString());
        }
    }

}
