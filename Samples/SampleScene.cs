using OpenInPlace;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class SampleScene : MonoBehaviour
{
    const string resourceName = "sample";
    const string fileName = resourceName + ".txt";

    // Start is called before the first frame update
    void Start()
    {
        var path = Path.Combine(Application.persistentDataPath, fileName);
        if (!File.Exists(path))
        {
            var fileText = Resources.Load<TextAsset>(resourceName).text;
            File.WriteAllText(path, fileText);
        }
    }

    public void OpenFileInPlace()
    {
        FileOpener.OpenInPlace(fileName);
    }
}
