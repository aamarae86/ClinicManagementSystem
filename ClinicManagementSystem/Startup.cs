using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TravelPermit.Startup))]
namespace TravelPermit
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
