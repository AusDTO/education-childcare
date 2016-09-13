using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CC1.Startup))]
namespace CC1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
