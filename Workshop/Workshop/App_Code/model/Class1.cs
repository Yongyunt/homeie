using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
    
    public int P_ID { get;  set; }
    public int S_ID { get; set; }
    public int Amount { get; set; }
    public string P_Name { get; set; }
    public int Price { get; set; }
    public Class1(int P_id, int S_ID, int Amount, string P_Name, int Price )
    {
       
        this.P_ID = P_id;
        this.S_ID = S_ID;
        this.Amount = Amount;
        this.P_Name = P_Name;
        this.Price = Price;
    }
}