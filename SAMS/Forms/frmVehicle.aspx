<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmVehicle.aspx.cs" Inherits="Forms_frmVehicle" Title="SAMS: Vehicle Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" runat="Server">
    <script language="JavaScript" type="text/javascript">
 
    </script>
    <div id="right_data">
        <table width="100%">
            <tr>
                <td style="width: 100px">
                    <cc1:TabContainer ID="TabContainer1" runat="server" Height="435px" Width="850px"
                        ActiveTabIndex="0" OnActiveTabChanged="TabContainer1_ActiveTabChanged" AutoPostBack="true">
                        <cc1:TabPanel ID="TabPanel1" runat="server">
                            <HeaderTemplate>
                                Vehicle Defination
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="pnl_head" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td style="height: 20px">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="lbltoLocation" runat="server" Width="94px" Text="Location" CssClass="lblbox"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="drpDistributorVehicleDefination" runat="server" Width="180px"
                                                        CssClass="DropList" AutoPostBack="True" OnSelectedIndexChanged="drpDistributorVehicleDefination_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="Vehicle Name" CssClass="label"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtVehicleno" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                                <td style="width: 10px;">
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="Registration #"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMake" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="Model"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtModel" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                                <td style="width: 10px;">
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="Engine No"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEngine" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label80" runat="server" Text="Chassis No"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtChassisno" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                                <td style="width: 10px;">
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label9" runat="server" Text="Assign To" Visible="false"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DrpAssignToVehicleDefination" runat="server" Visible="false"
                                                        Width="180px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:CheckBox ID="chbIs_Active" Text="  Is Active" runat="server" Enabled="false"
                                                            Checked="true" /></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 5px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSaveVehicle" runat="server" Text="Save" CssClass="Button" OnClick="btnSaveVehicle_Click"
                                                        Width="80px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 10px;">
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="pnl_grd" runat="server" Width="670px" Height="200px" BorderWidth="1px"
                                                        BorderColor="Silver" ScrollBars="Vertical">
                                                        <asp:GridView ID="grd_vehicleDefination" runat="server" ForeColor="SteelBlue" CssClass="gridRow2"
                                                            Width="100%" HorizontalAlign="Center" AutoGenerateColumns="False" BorderColor="White"
                                                            OnRowEditing="grd_vehicleDefination_RowEditing">
                                                            <HeaderStyle HorizontalAlign="left" VerticalAlign="Middle" CssClass="tblhead" Height="30px" />
                                                            <Columns>
                                                                <asp:BoundField DataField="VEHICLE_ID" HeaderText="VEHICLE_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="VEHICLE_NO" HeaderText="Vehicle Name">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="85px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="MAKE" HeaderText="Registration #">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="MODEL" HeaderText="Model">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ENGINE_NO" HeaderText="Engine No">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="CHASSIS_NO" HeaderText="Chassis No">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="USER_NAME" HeaderText="Assign To">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="IS_ACTIVE" HeaderText="Is Active">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="DISTRIBUTOR_ID" HeaderText="DISTRIBUTOR_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ASSIGN_TO" HeaderText="ASSIGN_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:CommandField ShowEditButton="True">
                                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" Width="40px"></ItemStyle>
                                                                </asp:CommandField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server">
                            <HeaderTemplate>
                                Vehicle Assingment
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td style="height: 20px">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label1" runat="server" Width="94px" Text="Location" CssClass="lblbox"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="drpDistributorVehicleAssingment" runat="server" Width="180px"
                                                        CssClass="DropList" AutoPostBack="True" OnSelectedIndexChanged="drpDistributorVehicleAssingment_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label11" runat="server" Width="81px" Text="Designation" CssClass="lblbox"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DrpDesignation" runat="server" Width="180px" CssClass="DropList"
                                                        AutoPostBack="True" OnSelectedIndexChanged="DrpDesignation_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="Vehicle Name" CssClass="label"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DrpVehicleno" runat="server" Width="180px" CssClass="DropList"
                                                        AutoPostBack="True" OnSelectedIndexChanged="DrpVehicleno_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 10px;">
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="Assign To"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DrpAssignToVehicleAssingment" runat="server" Width="180px"
                                                        AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label62" runat="server" Text="Registration #"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMakeVAssingment" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                                <td style="width: 10px;">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:CheckBox ID="chbIs_ActiveVAssingment" Text="  Is Active" runat="server" Checked="true" Visible="false" /></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label10" runat="server" Text="Chassis No"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtChassisnoVAssingment" runat="server" Width="180px"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td style="width: 10px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label411" runat="server" Text="Model" Visible="false"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtModelVAssingment" runat="server" Width="180px" Visible="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="Label12" runat="server" Text="Engine No" Visible="false"></asp:Label></strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEngineVAssingment" runat="server" Width="180px" Visible="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 5px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSaveVehicleAssingment" runat="server" Text="Save" CssClass="Button"
                                                        OnClick="btnSaveVehicleAssingment_Click" Width="80px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 10px;">
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel1" runat="server" Width="670px" Height="230px" BorderWidth="1px"
                                                        BorderColor="Silver" ScrollBars="Vertical">
                                                        <asp:GridView ID="Grd_VehicleAssingment" runat="server" ForeColor="SteelBlue" CssClass="gridRow2"
                                                            Width="100%" HorizontalAlign="Center" AutoGenerateColumns="False" BorderColor="White"
                                                            OnRowEditing="Grd_VehicleAssingment_RowEditing">
                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="tblhead" Height="30px" />
                                                            <Columns>
                                                                <asp:BoundField DataField="VEHICLE_ID" HeaderText="VEHICLE_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="VEHICLE_NO" HeaderText="Vehicle Name">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="95px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="MAKE" HeaderText="Registation #">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="MODEL" HeaderText="Model">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="100px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ENGINE_NO" HeaderText="Engine No">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="CHASSIS_NO" HeaderText="Chassis No">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="USER_NAME" HeaderText="Delivery Man">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="130px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="OrderBooker" HeaderText="">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Driver" HeaderText="Driver">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="130px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Loader" HeaderText="Loader">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="130px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="IS_ACTIVE" HeaderText="Is Active">
                                                                    <ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"
                                                                        Width="50px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="DISTRIBUTOR_ID" HeaderText="DISTRIBUTOR_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ASSIGN_TO" HeaderText="ASSIGN_ID">
                                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
