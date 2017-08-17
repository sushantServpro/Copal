using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace BussLayer
{
    public class Helper
    {
        public void SetDropDownText(DropDownList argDropDownList, string argText, string argEmptyText = "", string argEmptyTextValue = "0")
        {
            argDropDownList.ClearSelection();
            try
            {
                //argDropDownList.Items.FindByText(argText).Selected = True

                foreach (ListItem item in argDropDownList.Items)
                {
                    if (item.Text.ToUpper() == argText.ToUpper())
                    {
                        item.Selected = true;
                        return;
                    }
                }

            }
            catch (Exception ex)
            {
                try
                {
                    //argDropDownList.Items.FindByText(argEmptyText).Selected = True
                    foreach (ListItem item in argDropDownList.Items)
                    {
                        if (item.Text.ToUpper() == argEmptyText.ToUpper())
                        {
                            item.Selected = true;
                            return;
                        }
                    }
                }
                catch (Exception ex1)
                {
                    ListItem tListItem = new ListItem();
                    tListItem.Text = argEmptyText;
                    tListItem.Value = argEmptyTextValue;
                    argDropDownList.Items.Insert(0, tListItem);
                    argDropDownList.Items.FindByText(argEmptyText).Selected = true;
                }


            }
            finally
            {
            }


        }

        public void SetDropDownValue(DropDownList argDropDownList, string argText, string argEmptyText = "", string argEmptyTextValue = "0")
        {
            argDropDownList.ClearSelection();
            try
            {
                //argDropDownList.Items.FindByText(argText).Selected = True

                foreach (ListItem item in argDropDownList.Items)
                {
                    if (item.Value.ToUpper() == argText.ToUpper())
                    {
                        item.Selected = true;
                        return;
                    }
                }

            }
            catch (Exception ex)
            {
                try
                {
                    //argDropDownList.Items.FindByText(argEmptyText).Selected = True
                    foreach (ListItem item in argDropDownList.Items)
                    {
                        if (item.Text.ToUpper() == argEmptyText.ToUpper())
                        {
                            item.Selected = true;
                            return;
                        }
                    }
                }
                catch (Exception ex1)
                {
                    ListItem tListItem = new ListItem();
                    tListItem.Text = argEmptyText;
                    tListItem.Value = argEmptyTextValue;
                    argDropDownList.Items.Insert(0, tListItem);
                    argDropDownList.Items.FindByText(argEmptyText).Selected = true;
                }


            }
            finally
            {
            }


        }

    }
}
