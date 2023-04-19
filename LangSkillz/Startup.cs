using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LangSkillz.Startup))]
namespace LangSkillz
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
