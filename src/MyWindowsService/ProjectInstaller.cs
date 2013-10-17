using System.ComponentModel;
using System.Configuration.Install;
using System.ServiceProcess;

namespace MyWindowsService
{
    /// <summary>
    /// This class is only needed when using InstallUtil.
    /// </summary>
    [RunInstaller(true)]
    public class ProjectInstaller : Installer
    {
        public ProjectInstaller()
        {
            Installers.Add(new ServiceProcessInstaller
            {
                Account = ServiceAccount.LocalSystem
            });

            Installers.Add(new ServiceInstaller
            {
                ServiceName = "MyWindowsService",
                StartType = ServiceStartMode.Automatic
            });
        }
    }
}