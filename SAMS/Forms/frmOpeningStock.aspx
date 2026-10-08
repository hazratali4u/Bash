<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmOpeningStock.aspx.cs" Inherits="Forms_frmOpeningStock" Title="SAMS: Stock Adjustment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">
        function ConfirmDelete() {
            if (confirm("Do you want to Cancel this record?") == true)
                return true;

            else {
                return false;
            }
        }

        function ValidateForm() {
            var str;
            str = document.getElementById('<%=txtskuName.ClientID%>').value;
            if (str == null || str.length == 0) {
                alert('Must Select SKU Name');
                return false;
            }

            str = document.getElementById('<%=txtQuantity.ClientID%>').value;
            var str2 = document.getElementById('<%=txtCtn.ClientID%>').value;
            if ((str == null || str.length == 0) && (str2 == null || str2.length == 0)) {
                alert('Must Enter Quantity');
                return false;
            }

            return true;
        }
        function SearchList() {
            var l = document.getElementById('<%= lstCode.ClientID %>');
            var tb = document.getElementById('<%= txtskuCode.ClientID %>');

            if (tb.value == "") {
                ClearSelection(l);
            }
            else {
                for (var i = 0; i < l.options.length; i++) {
                    if (l.options[i].value.toLowerCase().match(tb.value.toLowerCase())) {
                        l.options[i].selected = true;
                        return false;
                    }
                    else {
                        ClearSelection(l);
                    }
                }
            }
        }
        function SearchedCode() {
            var l = document.getElementById('<%= lstCode.ClientID %>');
            var str;
            for (var i = 0; i < l.options.length; i++) {
                if (l.options[i].selected) {
                    str = l.options[i].value;
                    ClearSelection(l);
                    break;
                }
                else {
                    str = "";
                }
            }
            var stroption = document.getElementById("<%= txtskuCode.ClientID %>").value;
            if (str.length > 0) {
                document.getElementById("<%= txtskuName.ClientID %>").value = str.substring(0, str.lastIndexOf('-'));
                document.getElementById("<%= txtskuCode.ClientID %>").value = str.substring(str.lastIndexOf('-') + 1);
                document.getElementById("<%= Panel1.ClientID %>").className = "HidePanel";
            }
            else if (stroption.length == 0) {
                document.getElementById("<%= Panel1.ClientID %>").className = "ShowPanel";
                document.getElementById("<%= lstCode.ClientID %>").focus();

            }

        }
        function SelectCode(e) {
            var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
            if (key == 13) {
                e.preventDefault();
                var str = document.getElementById("<%= lstCode.ClientID %>").value;
                document.getElementById("<%= txtskuName.ClientID %>").value = str.substring(0, str.lastIndexOf('-'));
                document.getElementById("<%= txtskuCode.ClientID %>").value = str.substring(str.lastIndexOf('-') + 1);
                document.getElementById("<%= Panel1.ClientID %>").className = "HidePanel";
                document.getElementById("<%= txtCtn.ClientID %>").focus();

            }
        }
        function ClearSelection(lb) {
            lb.selectedIndex = -1;
        }
 
    </script>
    <div id="right_data">
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>                                        
                                        <tr>
                                            <td style="height: 25px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Width="98px" Height="14px" Text="Transaction Type"
                                                        CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="DrpDocumentType" runat="server" Width="200px" CssClass="DropList"
                                                    AutoPostBack="True" OnSelectedIndexChanged="DrpDocumentType_SelectedIndexChanged">
                                                    <asp:ListItem Value="7">Opening Stock</asp:ListItem>
                                                    <asp:ListItem Value="8">Short</asp:ListItem>
                                                    <asp:ListItem Value="9">Execes</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Width="50px" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px" align="left">
                                                <strong>
                                                    <asp:Label ID="lblDocumentNo" runat="server" Width="94px" Text="Document No" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="drpDocumentNo" runat="server" Width="200px" CssClass="DropList"
                                                    AutoPostBack="True" OnSelectedIndexChanged="drpDocumentNo_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px" align="left">
                                                <strong>
                                                    <asp:Label ID="lbltoLocation" runat="server" Width="94px" Text="Principal" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="drpPrincipal" runat="server" Width="200px" CssClass="DropList"
                                                    AutoPostBack="True" OnSelectedIndexChanged="drpPrincipal_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px" align="left">
                                                <strong>
                                                    <asp:Label ID="lblfromLocation" runat="server" Width="94px" Text="Location" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:DropDownList ID="drpDistributor" runat="server" Width="200px" CssClass="DropList"
                                                    AutoPostBack="True" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td align="left" colspan="1">
                                            </td>
                                            <td style="width: 316px" valign="middle" align="center" colspan="1" rowspan="7"> 
                                            <div style="left: 10px; position: absolute; top: 275px">                                               
                                                <asp:Panel ID="Panel1" runat="server" Width="250px" Height="170px" CssClass="HidePanel"
                                                    BorderWidth="1px" BorderStyle="Groove" BorderColor="Silver" BackColor="Silver">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" CssClass="lblbox" Width="170px">Select from SKU List</asp:Label></strong>
                                                    <asp:ListBox ID="lstCode" runat="server" Height="154px" onkeydown="SelectCode(event)"
                                                        SelectionMode="Multiple" Width="245px"></asp:ListBox>
                                                </asp:Panel>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 25px" align="left">
                                                <strong>
                                                    <asp:Label ID="Label1" runat="server" Width="94px" Text="Remarks" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td style="height: 25px">
                                                <asp:TextBox ID="txtDocumentNo" runat="server" Width="195px" CssClass="txtBox"></asp:TextBox>
                                            </td>
                                            <td style="height: 25px">
                                            </td>
                                        </tr>                                        
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblskuCode" runat="server" Width="87px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="  SKU Code" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td style="width: 100px">
                                                <asp:Label ID="lblskuname" runat="server" Width="206px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="   SKU Name" CssClass="lblbox" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblCtn" runat="server" Width="76px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Ctn" CssClass="lblbox" BackColor="#006699"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblUnit" runat="server" Width="77px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Unit" BackColor="#006699" Enabled="False"></asp:Label>
                                            </td>                                           
                                            <td style="width: 100px">
                                                <asp:Label ID="Label41" runat="server" Width="92px" Height="16px" ForeColor="White"
                                                    Font-Bold="True" Text="Add SKU" CssClass="lblbox" BackColor="#006699"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtskuCode" onkeyup="SearchList()" runat="server" Width="82px" CssClass="txtBox"></asp:TextBox>
                                            </td>
                                            <td style="width: 100px">
                                                <asp:TextBox ID="txtskuName" runat="server" Width="200px" Font-Bold="True" CssClass="txtBox"
                                                    Enabled="False"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCtn" onfocus="SearchedCode()" runat="server" Width="70px"
                                                    CssClass="txtBox "></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtQuantity" runat="server" Width="70px"></asp:TextBox>
                                            </td>                                           
                                            <td style="width: 100px">
                                                <asp:Button AccessKey="A" ID="btnSave" OnClick="btnSave_Click" runat="server" Width="95px"
                                                    Font-Size="8pt" Text="Add Sku" ValidationGroup="vg" CssClass="Button" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="5">
                                                <asp:Panel ID="Panel2" runat="server" Width="555px" Height="140px" ScrollBars="Vertical"
                                                    BorderWidth="1px" BorderStyle="Groove" BorderColor="Silver">
                                                    <asp:GridView ID="GrdPurchase" runat="server" Width="100%" ForeColor="SteelBlue"
                                                        CssClass="gridRow2" BorderColor="White" BackColor="White" ShowHeader="False"
                                                        OnRowDeleting="GrdPurchase_RowDeleting" HorizontalAlign="Center" AutoGenerateColumns="False">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                            PreviousPageText="Previous" />
                                                        <RowStyle ForeColor="Black" />
                                                        <Columns>
                                                            <asp:BoundField DataField="SKU_ID" HeaderText="SKU_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SKU_CODE" HeaderText="SKU Code">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left"
                                                                    Width="85px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SKU_NAME" HeaderText="SKU Name">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left"
                                                                    Width="205px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="QuantityCtn" HeaderText="Ctn">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right"
                                                                    Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Quantity" HeaderText="Unit">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right"
                                                                    Width="75px" />
                                                            </asp:BoundField>                                                                                                                       
                                                            <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
                                                                        Text="Delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" Width="70px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <FooterStyle BackColor="White" />
                                                        <PagerStyle BackColor="Transparent" />
                                                        <HeaderStyle BackColor="#007395" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                            VerticalAlign="Middle" />
                                                        <AlternatingRowStyle BackColor="#F2F2F2" CssClass="GridAlternateRowStyle" ForeColor="#333333" />
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" align="center">
                                                <asp:Button AccessKey="S" ID="btnSaveDocument" OnClick="btnSaveDocument_Click" runat="server"
                                    Width="119px" Font-Size="8pt" Text="Save Document" UseSubmitBehavior="False"
                                    CssClass="Button" />
                                <asp:Button AccessKey="C" ID="btnCancel" OnClick="btnCancel_Click" runat="server"
                                    Width="120px" Font-Size="8pt" Text="Cancel" UseSubmitBehavior="False" CssClass="Button" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>                                
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
