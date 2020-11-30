using System;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics;

/*
Author: Tony Lambert, Twitter: @ForensicITGuy
License: MIT License
Step One:
C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe T1010.cs
Step Two:
T1010.exe
*/

namespace WindowLister
{
    class Lister 
    {
        static List<string> ListMainWindowTitles()
        {
            List<string> windowTitlesList = new List<string>();

            Process[] processlist = Process.GetProcesses();

            foreach (Process process in processlist)
            {
                string titleOutputLine;

                if (!String.IsNullOrEmpty(process.MainWindowTitle))
                {
                    titleOutputLine = "Process: " + process.ProcessName + " ID: " + process.Id + " Main Window title: " + process.MainWindowTitle+"\n";
                    windowTitlesList.Add(titleOutputLine);
                }
            }

            return windowTitlesList;
        }

        static void Main(string[] args) 
        {
            List<string> windowTitlesList = ListMainWindowTitles();
            String mypath = Path.GetTempPath() + "T1010.txt";
            FileStream fs = File.Create(mypath);
            fs.Close();
            StreamWriter sw = new StreamWriter(mypath);
            windowTitlesList.ForEach(i => sw.WriteLine(i));
            sw.Close();
            
        }
    }
}