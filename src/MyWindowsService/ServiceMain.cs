using System;
using System.ServiceProcess;

namespace MyWindowsService
{
    /// <summary>
    /// To debug the service, add -D to the command line options in the project properties.
    /// </summary>
    class ServiceMain : ServiceBase
    {
        static void Main(string[] args)
        {
            var service = new ServiceMain();
            if (args != null && args.Length > 0)
            {
                switch (args[0].ToUpper())
                {
                    case "-D":
                        service.DebugMode();
                        return;
                }
            }

            ServiceBase.Run(service);
        }

        private void DebugMode()
        {
            OnStart(null);

            Console.WriteLine("Service started...");
            Console.WriteLine("<press any key to exit>");
            Console.Read();
        }

        protected override void OnStart(string[] args)
        {
            // Look mom! I do nothing.... all the time!
        }

        protected override void OnStop()
        {
            
        }
    }
}
