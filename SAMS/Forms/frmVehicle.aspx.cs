using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommon.Classes;


public partial class Forms_frmVehicle : System.Web.UI.Page
{
    private static int RowId;
    static long v_id = Constants.LongNullValue;
    DistributorController DC_ctrl = new DistributorController();
    static DataTable dt_V = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            #region Vehicle Defination Tab
            LoadVehicleDefinationDistributor();
            LoadVehicleDefinationDeliveryman();
            LoadVehicleDefinationGrid();
            #endregion

            #region Vehicle Assingment Tab
            LoadDistributor();
            LoadDesignation();
            LoadSaleForce();
            loadVehicle();
            LoadVehicleAssingmentGrid();

            txtChassisnoVAssingment.Attributes.Add("Readonly", "Readonly");
            txtEngineVAssingment.Attributes.Add("Readonly", "Readonly");
            txtMakeVAssingment.Attributes.Add("Readonly", "Readonly");
            txtModelVAssingment.Attributes.Add("Readonly", "Readonly");
            #endregion
        }
    }

    #region Vehicle Defination Tab

    private void LoadVehicleDefinationDistributor()
    {

        DataTable dt = DC_ctrl.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDistributorVehicleDefination, dt, 0, 2, true);
    }
    private void LoadVehicleDefinationDeliveryman()
    {
        if (drpDistributorVehicleDefination.Items.Count > 0)
        {
            SaleForceController mDController = new SaleForceController();
            DataTable m_dt = mDController.SelectSaleForceAssignedArea(int.Parse(drpDistributorVehicleDefination.SelectedValue), Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()));
            clsWebFormUtil.FillDropDownList(this.DrpAssignToVehicleDefination, m_dt, 0, 3, true);
        }
    }
    private void LoadVehicleDefinationGrid()
    {

        DataTable g_dt = DC_ctrl.SelectVehicleInfo2(int.Parse(drpDistributorVehicleDefination.SelectedValue), DateTime.Parse(this.Session["currentworkdate"].ToString()));

        grd_vehicleDefination.DataSource = g_dt;
        grd_vehicleDefination.DataBind();
    }

    protected void drpDistributorVehicleDefination_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadVehicleDefinationDeliveryman();
        LoadVehicleDefinationGrid();
    }

    protected void grd_vehicleDefination_RowEditing(object sender, GridViewEditEventArgs e)
    {

        RowId = e.NewEditIndex;
        v_id = Convert.ToInt64(grd_vehicleDefination.Rows[e.NewEditIndex].Cells[0].Text);
        txtVehicleno.Text = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[1].Text;
        txtMake.Text = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[2].Text;
        txtModel.Text = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[3].Text;
        txtEngine.Text = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[4].Text;
        txtChassisno.Text = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[5].Text;
        string chk = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[7].Text;

        if (chk == "True")
        {
            chbIs_Active.Checked = true;
        }
        else
        {
            chbIs_Active.Checked = false;
        }
        drpDistributorVehicleDefination.SelectedValue = grd_vehicleDefination.Rows[e.NewEditIndex].Cells[8].Text;
        // DrpAssignTo.SelectedValue = grd_vehicle.Rows[e.NewEditIndex].Cells[9].Text;

        btnSaveVehicle.Text = "Update";
        chbIs_Active.Enabled = true;
    }
    protected void btnSaveVehicle_Click(object sender, EventArgs e)
    {
        if (btnSaveVehicle.Text != "Update")
        {
            v_id = Constants.LongNullValue;
        }
        bool isInserted = DC_ctrl.InsertVehicle(v_id, int.Parse(drpDistributorVehicleDefination.SelectedValue), txtVehicleno.Text.ToString(), txtMake.Text.ToString(), txtModel.Text.ToString(), txtEngine.Text.ToString(), txtChassisno.Text.ToString()
                          , -1, DateTime.Parse(this.Session["currentworkdate"].ToString()), DateTime.Parse(this.Session["currentworkdate"].ToString()), int.Parse(this.Session["userid"].ToString()), chbIs_Active.Checked, Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue);
        if (isInserted == true)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "msg", "alert('Record insert successfully.');");
            ClearAll();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "msg", "alert('Some error occurred.');");
        }
    }
    private void ClearAll()
    {
        txtVehicleno.Text = "";
        txtChassisno.Text = "";
        txtEngine.Text = "";
        txtMake.Text = "";
        txtModel.Text = "";
        txtChassisno.Text = "";
        btnSaveVehicle.Text = "Save";
        chbIs_Active.Enabled = false;
        chbIs_Active.Checked = true;
        LoadVehicleDefinationDistributor();
        LoadVehicleDefinationDeliveryman();
        LoadVehicleDefinationGrid();
    }

    #endregion

    #region Vehicle Assingment Tab
    private void LoadDesignation()
    {
        DrpDesignation.Items.Clear();
        SLASHCodesController mController = new SLASHCodesController();
        DataTable m_dt = mController.SelectSlashCodes2(Constants.IntNullValue, null, Constants.SaleForce, null, Constants.IntNullValue, true);
        for (int i = 0; i < m_dt.Rows.Count; i++)
        {
            if (int.Parse(m_dt.Rows[i]["SLASH_CODE"].ToString()) == Constants.SALES_FORCE_DELIVERYMAN || int.Parse(m_dt.Rows[i]["SLASH_CODE"].ToString()) == Constants.SALES_Driver || int.Parse(m_dt.Rows[i]["SLASH_CODE"].ToString()) == Constants.SALES_Loader)
            {
                DrpDesignation.Items.Add(new ListItem(m_dt.Rows[i]["SLASH_DESC"].ToString(), m_dt.Rows[i]["REF_ID"].ToString()));
            }
        }
    }
    private void LoadSaleForce()
    {
        if (drpDistributorVehicleAssingment .Items.Count > 0 && DrpDesignation.Items.Count > 0)
        {
            if (int.Parse(DrpDesignation.SelectedValue) == Constants.SALES_FORCE_DELIVERYMAN)
            {
                SaleForceController mDController = new SaleForceController();
                DataTable m_dt = mDController.SelectSaleForceAssignedArea(int.Parse(drpDistributorVehicleAssingment.SelectedValue.ToString()), Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()));
                clsWebFormUtil.FillDropDownList(this.DrpAssignToVehicleAssingment, m_dt, 0, 3, true);
            }
            else
            {

                Distributor_UserController UCtl = new Distributor_UserController();
                DataTable dt = UCtl.SelectDistributorUser(int.Parse(DrpDesignation.SelectedValue.ToString()), int.Parse(drpDistributorVehicleAssingment.SelectedValue.ToString()), int.Parse(this.Session["CompanyId"].ToString()));
                clsWebFormUtil.FillDropDownList(this.DrpAssignToVehicleAssingment, dt, 0, 6, true);
            }
        }
    }
    private void LoadDistributor()
    {

        DataTable dt = DC_ctrl.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDistributorVehicleAssingment, dt, 0, 2, true);
    }
    private void LoadDeliveryman()
    {
        if (drpDistributorVehicleAssingment.Items.Count > 0)
        {
            SaleForceController mDController = new SaleForceController();
            DataTable m_dt = mDController.SelectSaleForceAssignedArea(int.Parse(drpDistributorVehicleAssingment.SelectedValue), Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()));
            clsWebFormUtil.FillDropDownList(this.DrpAssignToVehicleAssingment, m_dt, 0, 3, true);
        }
    }
    private void LoadVehicleAssingmentGrid()
    {

        DataTable g_dt = DC_ctrl.SelectVehicleInfo(int.Parse(drpDistributorVehicleAssingment.SelectedValue), DateTime.Parse(this.Session["currentworkdate"].ToString()));
        Grd_VehicleAssingment.DataSource = g_dt;
        Grd_VehicleAssingment.DataBind();
    }
    private void loadVehicle()
    {
        DrpVehicleno.Items.Clear();
        dt_V = DC_ctrl.SelectVehicleNO2(int.Parse(drpDistributorVehicleAssingment.SelectedValue));
        clsWebFormUtil.FillDropDownList(this.DrpVehicleno, dt_V, 0, 2, true);
        DrpVehicleno_SelectedIndexChanged(null, null);
    }


    protected void drpDistributorVehicleAssingment_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadDeliveryman();
        this.LoadVehicleAssingmentGrid();
        loadVehicle();

    }

    protected void Grd_VehicleAssingment_RowEditing(object sender, GridViewEditEventArgs e)
    {

        RowId = e.NewEditIndex;
        v_id = Convert.ToInt64(Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[0].Text);
        // txtVehicleno.Text = grd_vehicle.Rows[e.NewEditIndex].Cells[1].Text;
        txtMakeVAssingment.Text = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[2].Text;
        txtModelVAssingment.Text = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[3].Text;
        txtEngineVAssingment.Text = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[4].Text;
        txtChassisnoVAssingment.Text = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[5].Text;
        string chk = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[7].Text;

        if (chk == "True")
        {
            chbIs_ActiveVAssingment.Checked = true;
        }
        else
        {
            chbIs_ActiveVAssingment.Checked = false;
        }
        drpDistributorVehicleAssingment.SelectedValue = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[8].Text;
        DrpAssignToVehicleAssingment.SelectedValue = Grd_VehicleAssingment.Rows[e.NewEditIndex].Cells[9].Text;

        btnSaveVehicleAssingment.Text = "Update";
        chbIs_ActiveVAssingment.Enabled = true;
    }
    protected void btnSaveVehicleAssingment_Click(object sender, EventArgs e)
    {
        int Orderbooker_id = Constants.IntNullValue;
        int Driver_Id = Constants.IntNullValue;
        int DeliveryMan_Id = Constants.IntNullValue;
        int LOADER_Id = Constants.IntNullValue;
        if (btnSaveVehicleAssingment.Text != "Update")
        {
            // v_id = Constants.LongNullValue;
        }


        if (int.Parse(DrpDesignation.SelectedValue) == Constants.SALES_FORCE_DELIVERYMAN)
        {
            DeliveryMan_Id = int.Parse(DrpAssignToVehicleAssingment.SelectedValue.ToString());

        }



        if (int.Parse(DrpDesignation.SelectedValue) == Constants.SALES_FORCE_ORDERBOOKER)
        {
            Orderbooker_id = int.Parse(DrpAssignToVehicleAssingment.SelectedValue.ToString());

        }

        if (int.Parse(DrpDesignation.SelectedValue) == 691)
        {
            Driver_Id = int.Parse(DrpAssignToVehicleAssingment.SelectedValue.ToString());
        }

        if (int.Parse(DrpDesignation.SelectedValue) == 692)
        {
            LOADER_Id = int.Parse(DrpAssignToVehicleAssingment.SelectedValue.ToString());
        }



        bool isInserted = DC_ctrl.InsertVehicle(v_id, int.Parse(drpDistributorVehicleAssingment.SelectedValue), DrpVehicleno.SelectedItem.Text, txtMakeVAssingment.Text.ToString(), txtModelVAssingment.Text.ToString(), txtEngineVAssingment.Text.ToString(), txtChassisnoVAssingment.Text.ToString()
                          , DeliveryMan_Id, DateTime.Parse(this.Session["currentworkdate"].ToString()), DateTime.Parse(this.Session["currentworkdate"].ToString()), int.Parse(this.Session["userid"].ToString()), chbIs_ActiveVAssingment.Checked, Orderbooker_id, Driver_Id, LOADER_Id);
        if (isInserted == true)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "msg", "alert('Record insert successfully.');");
            ClearVehicleDefinationAll();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "msg", "alert('Some error occurred.');");
        }
    }
    private void ClearVehicleDefinationAll()
    {
       
        //txtChassisnoVAssingment.Text = "";
        //txtEngineVAssingment.Text = "";
        //txtMakeVAssingment.Text = "";
        //txtModelVAssingment.Text = "";

        //btnSaveVehicleAssingment.Text = "Save";
        //chbIs_ActiveVAssingment.Enabled = false;
        chbIs_ActiveVAssingment.Checked = true;
        LoadDistributor();
        LoadDesignation();
        LoadDeliveryman();
        loadVehicle();
        LoadVehicleAssingmentGrid();
    }

    protected void DrpVehicleno_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(dt_V != null){

        DataRow[] foundRows = dt_V.Select("VEHICLE_ID  = '" + DrpVehicleno.SelectedValue + "'");
        if (foundRows.Length > 0)
        {
            v_id = long.Parse(foundRows[0]["VEHICLE_ID"].ToString());
            drpDistributorVehicleAssingment.SelectedValue = foundRows[0]["DISTRIBUTOR_ID"].ToString();


            txtMakeVAssingment.Text = foundRows[0]["MAKE"].ToString();
            txtModelVAssingment.Text = foundRows[0]["MODEL"].ToString();
            txtEngineVAssingment.Text = foundRows[0]["ENGINE_NO"].ToString();
            txtChassisnoVAssingment.Text = foundRows[0]["CHASSIS_NO"].ToString();
            string chk = foundRows[0]["IS_ACTIVE"].ToString();
            if (chk == "True")
            {
                chbIs_ActiveVAssingment.Checked = true;
            }
            else
            {
                chbIs_ActiveVAssingment.Checked = false;
            }

            if (foundRows[0]["ORDERBOOKER_ID"].ToString() != "")
            {
                this.LoadDesignation();
                // DrpDesignation.SelectedValue = foundRows[0]["ORDERBOOKER_ID"].ToString();
                this.LoadSaleForce();
                //DrpAssignTo.SelectedValue = foundRows[0]["ASSIGN_TO"].ToString();

            }
            else
            {
                // this.LoadDesignation();
                this.LoadSaleForce();
                //  DrpAssignTo.Items.Add(new clsListItems("New", Constants.IntNullValue.ToString()));
                //  DrpAssignTo.SelectedValue = Constants.IntNullValue.ToString();
            }



            if (foundRows[0]["ASSIGN_TO"].ToString() != "-1")
            {
                this.LoadDeliveryman();
                DrpAssignToVehicleAssingment.SelectedValue = foundRows[0]["ASSIGN_TO"].ToString();
            }
            else
            {
                DrpAssignToVehicleAssingment.Items.Add(new clsListItems("New", Constants.IntNullValue.ToString()));
                DrpAssignToVehicleAssingment.SelectedValue = Constants.IntNullValue.ToString();
            }
        }
        }
    }
    protected void DrpDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
         this.LoadSaleForce();
    }
    #endregion



    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        
            #region Vehicle Defination Tab
            LoadVehicleDefinationDistributor();
            LoadVehicleDefinationDeliveryman();
            LoadVehicleDefinationGrid();
            #endregion

            #region Vehicle Assingment Tab
            LoadDistributor();
            LoadDesignation();
            LoadSaleForce();
            loadVehicle();
            LoadVehicleAssingmentGrid();

            txtChassisnoVAssingment.Attributes.Add("Readonly", "Readonly");
            txtEngineVAssingment.Attributes.Add("Readonly", "Readonly");
            txtMakeVAssingment.Attributes.Add("Readonly", "Readonly");
            txtModelVAssingment.Attributes.Add("Readonly", "Readonly");
            #endregion
       
    }
}
    
