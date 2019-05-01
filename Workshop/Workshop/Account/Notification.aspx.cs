using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.calculator();
    }
    protected void calculator()
    {
        long sumcal = 0;
        if (GridView2.Rows.Count > 0)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                long number = long.Parse(row.Cells[4].Text);
                long price = long.Parse(row.Cells[5].Text);
                sumcal += number * price;
            }
            GridViewRow gvrow = GridView2.Rows[0];
            Label1.Text = sumcal.ToString();
        }
    }

}