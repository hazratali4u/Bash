using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;

/// <summary>
/// Form For Bank Transaction
/// </summary>
public partial class Forms_frmBillIssuance : System.Web.UI.Page
{
    LedgerController LController = new LedgerController();

    /// <summary>
    /// Page_Load Function Populates All Combos And Grid On The Page
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DateTime pOrderDate = DateTime.Parse(this.Session["CurrentWorkDate"].ToString());
            txtToDate.Text = pOrderDate.ToString("dd-MMM-yyyy");
            this.LoadDistributor();
            this.LoadData();
            this.LoadOrderBooker();
            this.SelectCreditInvoice();
           
         
            this.LoadGrid();
            
            
        }
    }


    private void LoadDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDistributor, dt, 0, 2, true);
    }
    private void LoadData()
    {
        GrdCredit.DataSource = null;
        GrdCredit.DataBind();
        if (drpDistributor.Items.Count > 0)
        {
            CustomerDataController mController = new CustomerDataController();

            DataTable dtCredit = LController.SelectCreditPendingInvoice(int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, Constants.LongNullValue, Constants.IntNullValue);
            clsWebFormUtil.FillDropDownList(this.DrpCustomer, dtCredit, 0, 1, true);

        }
    }
    private void LoadOrderBooker()
    {
        if (drpDistributor.Items.Count > 0)
        {
            SaleForceController mDController = new SaleForceController();
            DataTable m_dt = mDController.SelectSaleForceAssignedArea(Constants.SALES_FORCE_ORDERBOOKER, int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()), Constants.IntNullValue);
            clsWebFormUtil.FillDropDownList(this.DrpOrderBooker, m_dt, 0, 3, true);
        }
        else
        {
            DrpOrderBooker.Items.Clear();
        }
    }
    private void SelectCreditInvoice()
    {
        GrdCredit.DataSource = null;
        GrdCredit.DataBind();
        if (DrpCustomer.Items.Count > 0)
        {
            
            DataTable dtCredit = LController.SelectCreditPendingInvoice(int.Parse(drpDistributor.SelectedValue.ToString()), Constants.IntNullValue, long.Parse(DrpCustomer.SelectedValue.ToString()), -2);
            GrdCredit.DataSource = dtCredit;
            GrdCredit.DataBind();
        }
    }
   

    private void ClearAll()
    {       
        txtRemarks.Text = "";
        btnSave.Text = "Save";
    }
    

    private void LoadGrid()
    {
            
            if (drpDistributor.Items.Count > 0 && DrpCustomer .Items.Count >0 )
            {
                DataTable dt = LController.SelectIssuedbill(int.Parse(drpDistributor.SelectedValue.ToString()),int.Parse(DrpCustomer .SelectedValue ),  DateTime.Parse(txtToDate.Text), Constants .DateNullValue);
                GrdBillIssue.DataSource = dt;
                GrdBillIssue.DataBind();
            }
        
    }

 
    protected void drpDistributor_SelectedIndexChanged(object sender, EventArgs e)
    {
      
            this.LoadData();
            this.LoadGrid();
 
        this.LoadOrderBooker();
      
    }


    protected void DrpCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.SelectCreditInvoice();
        this.LoadGrid();
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int InvoiceCount = Constants.IntNullValue;
        if (IsDayClosed())
        {
            UserController UserCtl = new UserController();

            UserCtl.InsertUserLogoutTime(Convert.ToInt32(Session["User_Log_ID"]), Convert.ToInt32(Session["UserID"]));
            this.Session.Clear();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("../Login.aspx");
        }
        else
        {
            foreach (GridViewRow dr in GrdCredit.Rows)
            {
                CheckBox chRelized = (CheckBox)dr.Cells[0].FindControl("ChbIsAssigned");
                if (chRelized.Checked == true)
                {
                    InvoiceCount++;
                    break;
                }
            }
            if (InvoiceCount == Constants.IntNullValue)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Must Select Invoice');", true);
                return;
            }
            foreach (GridViewRow dr in GrdCredit.Rows)
            {
                CheckBox chRelized = (CheckBox)dr.Cells[0].FindControl("ChbIsAssigned");
                if (chRelized.Checked == true)
                {
                    txtDocumentDate.Text = (DateTime.Parse(dr.Cells[2].Text)).ToString("dd-MMM-yyyy");
                    SaleForceController mSaleForce = new SaleForceController();
                    mSaleForce.InsertBillIssuance(Convert.ToInt32(drpDistributor.SelectedValue), int.Parse(dr.Cells[10].Text), int.Parse(DrpOrderBooker.SelectedValue), int.Parse(dr.Cells[4].Text), int.Parse(this.Session["UserId"].ToString()), decimal.Parse(dr.Cells[3].Text), DateTime.Parse(txtDocumentDate.Text), DateTime.Parse(txtToDate.Text), Constants.DateNullValue, Constants.DateNullValue, false, long.Parse(dr.Cells[7].Text), long.Parse(dr.Cells[8].Text), Constants.LongNullValue, dr.Cells[1].Text, txtRemarks.Text);
            
                }
            }



                this.ClearAll();
                this.LoadGrid();
          
            
        }
    }



    private bool IsDayClosed()
    {
        bool flag = false;
        DistributorController DistrCtl = new DistributorController();
        DataTable dtDayClose = DistrCtl.MaxDayClose(Convert.ToInt32(drpDistributor.SelectedValue), 3);
        if (Convert.ToDateTime(Session["CurrentWorkDate"]) <= Convert.ToDateTime(dtDayClose.Rows[0]["DayClose"]))
        {
            flag = false;
        }
        else
        {
            flag = true;
        }

        return flag;
    }

    protected void txtToDate_TextChanged(object sender, EventArgs e)
    {
        this.LoadGrid();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearAll();
    }


    protected void GrdBillIssue_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataControl dc = new DataControl();
        SaleForceController mSaleForce = new SaleForceController();
       
        
            mSaleForce.DeleteBillIssuance(int.Parse(dc.chkNull_0(GrdBillIssue.Rows[e.RowIndex].Cells[0].Text)));
        
        this.LoadGrid();
        
        

    }

}