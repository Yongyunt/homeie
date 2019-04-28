using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Service : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Suck_Click(object sender, EventArgs e)
    {
        Response.RedirectPermanent("Pricing.aspx?S_ID=1");
    }

    protected void reed_Click(object sender, EventArgs e)
    {
        Response.RedirectPermanent("Pricing.aspx?S_ID=2");
    }

    protected void Suckandreed_Click(object sender, EventArgs e)
    {
        Response.RedirectPermanent("Pricing.aspx?S_ID=3");
    }
}