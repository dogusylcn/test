  
using System;
using System.EnterpriseServices;
using System.Runtime.InteropServices;
namespace regsvcser
{

    public class Bypass : ServicedComponent
    {
        public Bypass() { Console.WriteLine("I am a basic COM Object"); }

		[ComRegisterFunction] //This executes if registration is successful
		public static void RegisterClass ( string key )
		{
			Console.WriteLine("Fail");
		}

		[ComUnregisterFunction] //This executes if registration fails
		public static void UnRegisterClass ( string key )
		{
			Console.WriteLine("Successful");
		}
    }
}