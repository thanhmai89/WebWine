using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebWine.Startup))]
namespace WebWine
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
