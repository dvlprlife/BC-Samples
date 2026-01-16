namespace dvlprlife.abouttitle1.abouttitle;

using Microsoft.Sales.Customer;

pageextension 50150 "Customer Card Tips" extends "Customer Card"
{
    AboutText = 'Use this page to maintain **customer master data** and review key settings before posting documents.';
    AboutTitle = 'About the customer card';

    layout
    {
        modify(Name)
        {
            AboutText = 'This is the *display name* used on documents and reports. Keep it consistent with what your customers expect.';
            AboutTitle = 'Customer name';
        }
    }
}