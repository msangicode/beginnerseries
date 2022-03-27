
pageextension 50103 SalesSetupPageExty extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Direct Debit Mandate Nos.")
        {
            field("Booking Nos."; Rec."Booking Nos.") { }
        }

    }
}
page 50102 Booking
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Booking;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Booking No."; Rec."Booking No.")
                {
                    ApplicationArea = All;

                }
                field("Customer No."; Rec.Customer)
                {
                    ApplicationArea = All;

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;

                }

                field("DateTime Created"; Rec."DateTime Created")
                {
                    ApplicationArea = All;

                }


                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;

                }


                field(TotalAmount; Rec.TotalAmount)
                {
                    ApplicationArea = All;

                }


            }

            part("Booking Line"; BookingPart)
            {
                SubPageLink = BookingNo = field("Booking No.");
            }
        }
    }


}

page 50103 BookingList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Booking;
    Caption = 'Booking List';
    CardPageId = Booking;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Booking No"; rec."Booking No.")
                {
                    ApplicationArea = All;

                }
                field("Customer No."; Rec.Customer)
                {
                    ApplicationArea = All;

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;

                }

                field("DateTime Created"; Rec."DateTime Created")
                {
                    ApplicationArea = All;

                }
            }
        }

    }


}

page 50105 BookingPart
{
    PageType = ListPart;
    SourceTable = BookingLine;
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(HouseNo; Rec.HouseNo)
                {
                    ApplicationArea = All;

                }
                field(HouseName; Rec.HouseName)
                {
                    ApplicationArea = All;

                }
                field(CostPerUnit; Rec.CostPerUnit)
                {
                    ApplicationArea = All;

                }
                field(NoOfNights; Rec.NoOfNights)
                {
                    ApplicationArea = All;

                }
                field(LineTotal; Rec.LineTotal)
                {
                    ApplicationArea = All;

                }

            }
        }

    }

}