<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true"
    CodeFile="frmBillIssuance.aspx.cs" Inherits="Forms_frmBillIssuance"
    Title="SAMS: Bill Issuance Form"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
    <script language="JavaScript" type="text/javascript">

        function ValidateForm() {
            return true;

        }
       
    </script>
    <div id="right_data">
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                            <ContentTemplate>
                                <table>
                                    <tbody>
                                  
                                        <tr>
                                            <td align="left" style="width: 116px">
                                                <strong>
                                                    <asp:Label ID="lblfromLocation" runat="server" Width="94px" Text="Location" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td style="width: 201px" align="left">
                                                <asp:DropDownList ID="drpDistributor" runat="server" Width="240px" CssClass="DropList"
                                                    OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 33px"></td>
                                          <td valign="middle" align="left" colspan="2" rowspan="8">
                                                <asp:Panel ID="Panel1" runat="server" Height="150px" Width="400px" ScrollBars="Auto" BorderColor="Silver"
                                                    BorderStyle="Groove" BorderWidth="1px" >
                                                    <asp:GridView ID="GrdCredit" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                        BorderColor="White" ForeColor="SteelBlue" HorizontalAlign="Center"
                                                        Width="100%"  DataKeyNames="SALE_INVOICE_ID">
                                                        
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="ChbIsAssigned" runat="server" Width="14px"  />
                                                                </ItemTemplate>
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="MANUAL_INVOICE_ID" HeaderText="Invoice No">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DOCUMENT_DATE" HeaderText="Invoice Date" >
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CURRENT_CREDIT_AMOUNT" HeaderText="Credit Amount" DataFormatString="{0:F2}">
                                                                <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DELIVERYMAN_ID" HeaderText="DELIVERYMAN_ID">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                              <asp:BoundField DataField="OrderBooker_Id" HeaderText="Order Booker">
                                                                 <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>  
                                                             <asp:BoundField DataField="OrderBooker" HeaderText="Order Booker">
                                                               <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                                                            </asp:BoundField>  
                                                             <asp:BoundField DataField="sale_invoice_Id" HeaderText="Order Booker">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField> 
                                                             <asp:BoundField DataField="Sold_To" HeaderText="Customer_Id">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField> 
                                                             <asp:BoundField DataField="sale_order_id" HeaderText="Customer_Id">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="principal_id" HeaderText="Customer_Id">
                                                                <HeaderStyle CssClass="HidePanel" />
                                                                <ItemStyle CssClass="HidePanel" />
                                                            </asp:BoundField>                                                           
                                                        </Columns>
                                                    <HeaderStyle CssClass="tblhead" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                      
                                        <tr>
                                       
                                          
                                          
                                            <td align="left" style="width: 116px">
                                                <strong>
                                                    <asp:Label ID="Label4" runat="server" Width="55px" Text="Customer" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="DrpCustomer" runat="server" Width="240px" CssClass="DropList"
                                                    OnSelectedIndexChanged="DrpCustomer_SelectedIndexChanged" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                           
                                        </tr>
                                    
                                       
                                        <tr>
                                           
                                            
                                            <td style="width: 116px" align="left">
                                            <strong>
                                                    <asp:Label ID="Label10" runat="server" Width="62px" Text="Assign to" CssClass="lblbox"></asp:Label>
                                            </td>
                                              <td  align="left">
                                                <asp:DropDownList ID="DrpOrderBooker" runat="server" Width="240px" CssClass="DropList">
                                                </asp:DropDownList>
                                            </td>
                                            
                                          
                                        </tr>
                                     
                                         <tr>
                                             <td align="left" style="width: 116px">
                                                <strong>
                                                    <asp:Label ID="Label7" runat="server" Text="Working Date" Width="94px"></asp:Label></strong>
                                            </td>
                                            <td align="left" style="width: 238px; height: 25px">
                                                <asp:TextBox ID="txtToDate" runat="server" CssClass="txtBox" MaxLength="10" 
                                                    Width="194px" ontextchanged="txtToDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    
                                                <asp:ImageButton ID="ImgBntToDate" runat="server" ImageUrl="~/App_Themes/Granite/Images/date.gif" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" EnableViewState="False"
                                                    Format="dd-MMM-yyyy" PopupButtonID="ImgBntToDate" TargetControlID="txtToDate">
                                                </ajaxToolkit:CalendarExtender>

                                                 <asp:TextBox ID="txtDocumentDate" runat="server" CssClass="txtBox" MaxLength="10" 
                                                    Width="194px" Visible="false"></asp:TextBox>
                                                   <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" EnableViewState="False"
                                                    Format="dd-MMM-yyyy" PopupButtonID="ImgBntToDate" TargetControlID="txtDocumentDate">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                           <tr>
                                          
                                            <td style="width: 116px" valign="top" align="left">
                                                <strong>
                                                    <asp:Label ID="Label9" runat="server" Width="73px" Text="Remarks" CssClass="lblbox"></asp:Label></strong>
                                            </td>
                                            
                                        
                                            <td style="width: 201px" valign="top" align="left">
                                                <asp:TextBox ID="txtRemarks" runat="server" Width="194px" CssClass="txtBox "></asp:TextBox>
                                            </td>
                                          </tr>
                                        <tr>
                                            <td style="height: 36px; width: 116px;" align="left">
                                                
                                            </td>
                                            <td style="width: 201px; height: 36px" valign="middle" align="left">                                                
                                                <div style="z-index: 101; left: 487px; width: 100px; position: absolute; top: 308px;
                                                    height: 100px">
                                                    <asp:Panel ID="Panel21" runat="server">
                                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                                            <ProgressTemplate>
                                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                                                    Width="23px" />
                                                                Wait Update
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                    </asp:Panel>
                                                </div>
                                            </td>
                                          
                                        </tr>
                                    </tbody>
                                </table>
                           
                            </ContentTemplate>
                            
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                            <td style="height: 36px" align="left">
                                                <asp:Button AccessKey="S" ID="btnSave" OnClick="btnSave_Click" runat="server" Width="102px"
                                                    Font-Size="8pt" Text="Save" CssClass="Button" />
                                            </td>
                                            <td style="width: 201px; height: 36px" valign="middle" align="left">
                                                <asp:Button AccessKey="C" ID="btnCancel" runat="server" Width="120px" Font-Size="8pt"
                                                    Text="Cancel" CssClass="Button" onclick="btnCancel_Click" />
                                            </td>
                                            <td style="width: 201px; height: 36px" valign="middle" align="left">
                                            </td>
                                            <td style="width: 201px; height: 36px" valign="middle" align="left">
                                            </td>
                                        </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table>
                        <tbody>
                            <tr>
                                <td style="height: 20px" align="left" colspan="5">
                                    <asp:Panel ID="Panel12" runat="server" Width="800px" Height="200px" ScrollBars="Vertical" BorderWidth="1px">
                                        <asp:GridView ID="GrdBillIssue" runat="server" Width="100%" ForeColor="SteelBlue" CssClass="tablesorter"
                                            BorderColor="White" HorizontalAlign="Center" OnRowDeleting="GrdBillIssue_RowDeleting"
                                            BackColor="White" AutoGenerateColumns="False"  DataKeyNames="BILL_ISSUANCE_ID">
                                           
                                            <Columns>
                                                <asp:BoundField DataField="BILL_ISSUANCE_ID" HeaderText="CUSTOMER_ID">
                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="Customer_name" HeaderText="Customer">
                                                         <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Width="150px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PRINCIPAL_ID" HeaderText="PRINCIPAL_ID">
                                                    <HeaderStyle CssClass="HidePanel"></HeaderStyle>
                                                    <ItemStyle CssClass="HidePanel"></ItemStyle>
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="sale_invoice_id" HeaderText="Invoice No">
                                                      <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="Document_Date"  HeaderText="Invoice Date" DataFormatString="{0:d}">
                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="total_net_amount" DataFormatString="{0:F2}" HeaderText="Amount">
                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"  Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                
                                                <asp:BoundField DataField="Remarks" HeaderText="Remarks">
                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"  Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="User_name" HeaderText="Assign To">
                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"  Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="Issued_Date"  HeaderText="Assign Date" DataFormatString="{0:d}">
                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"  Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="Sold_to" HeaderText="CUSTOMER_ID">
                                                    <HeaderStyle CssClass="HidePanel" />
                                                    <ItemStyle CssClass="HidePanel" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
                                                            Text="Delete"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
                                                </asp:TemplateField>                                                
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" CssClass="tblhead">
                                            </HeaderStyle>
                                        </asp:GridView>
                                      
                                      
                                    </asp:Panel>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
