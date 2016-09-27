<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Linq2SQL_WebApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Entry</title>
    <style type="text/css">
        .auto-style1
        {
        }

        .auto-style2
        {
            width: 141px;
            height: 23px;
        }

        .auto-style3
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Member ID</td>
                    <td>
                        <asp:Label ID="lblMemberID" runat="server" Text="[MemberID]"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="265px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Height="167px" TextMode="MultiLine" Width="265px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Place</td>
                    <td>
                        <asp:TextBox ID="txtPlace" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Join Date</td>
                    <td>
                        <asp:TextBox ID="txtJoinDate" runat="server"></asp:TextBox> [Format : dd/mm/yyyy]
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3" style="text-align: left; padding-left: 150px">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">
                        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateSelectButton="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                            <Columns>
                                   <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="false" CommandName="Select" Text="Select" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MemberID" HeaderText="Member ID" ItemStyle-Width="20px">
                                    <ItemStyle Width="20px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Member Name" ItemStyle-Width="300px">
                                    <ItemStyle Width="200px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="500px">
                                    <ItemStyle Width="350px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Place" HeaderText="Place" ItemStyle-Width="100px">
                                    <ItemStyle Width="100px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="JoinDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Join Date" ItemStyle-Width="100px">
                                    <ItemStyle Width="100px"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnNew" runat="server" CausesValidation="false" CommandName="NewMember" Text="New" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                    <ItemTemplate >
                                        <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="DeleteMember" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
