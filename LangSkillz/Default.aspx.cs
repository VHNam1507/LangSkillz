using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace LangSkillz
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                registerButton.Visible = false;
                loginButton.Visible = false;
                welcomeMessage.Visible = true;
            }
            else
            {
                registerButton.Visible = true;
                loginButton.Visible = true;
                welcomeMessage.Visible = false;
            }
        }

    }
}