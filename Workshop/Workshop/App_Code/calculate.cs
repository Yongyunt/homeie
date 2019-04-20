using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for calculate
/// </summary>
public class calculate
{
    public string name;
    public string result(int x, int y)
    {
            return string.Format("{0} : {1}", name, (x * y).ToString());
    }
    
             
}