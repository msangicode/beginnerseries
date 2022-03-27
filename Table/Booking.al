/* 
Booking

BookingNo : Code 10
Customer : Code 20 : Table Relation : Customer
Customer Name 
Booking Date : Date 
DateTime Created : DateTime;
Created By : Code 20
No Series : Code 10 
Amount : Decimal
Status : Option String Open,Pending,Approved,Rejected,Posted.
Total Amount : flowfield


Extend the resource type : Add the new enum (Room) resource type.

Booking Line

LineNo : Integer
BookingNo : Code 10
House Booked : Resource type : Resource : Room
Cost Per Unit : Decimal
No of Days : Int;
Line Total : Dec;

No. Series : x


if "No." = '' then begin
    SalesSetup.Get();
    SalesSetup.TestField("Booking Nos.");
    NoSeriesMgt.InitSeries(SalesSetup."Booking Nos.", xRec."No. Series", 0D, "No.", "No. Series");
end;

if "No." <> xRec."No." then begin
    SalesSetup.Get();
    NoSeriesMgt.TestManual(SalesSetup."Booking Nos.");
    "No. Series" := '';
end;

*/

tableextension 50101 SalesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Booking Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
    }


}

table 50101 Booking
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Booking No."; Code[10])
        {
            Editable = false;
            trigger OnValidate()
            begin
                if "Booking No." <> xRec."Booking No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Booking Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Customer"; Code[20])
        {
            TableRelation = Customer;
            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                Cust.Get(Customer);
                "Customer Name" := Cust.Name;
            end;

        }
        field(3; "Customer Name"; Text[100]) { Editable = false; }
        field(4; "DateTime Created"; DateTime) { Editable = false; }
        field(5; "Created By"; Code[30]) { Editable = false; }
        field(6; "No. Series"; Code[10]) { TableRelation = "No. Series"; }
        field(7; Amount; Decimal) { }
        field(8; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected,Posted;
        }

        field(9; TotalAmount; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(BookingLine.LineTotal where
         (BookingNo = field("Booking No.")));
        }


    }

    keys
    {
        key(pk; "Booking No.")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "Booking No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Booking Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Booking Nos.", xRec."No. Series", 0D, "Booking No.", "No. Series");
        end;
        "Created By" := UserId;
        "DateTime Created" := CurrentDateTime;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}

enumextension 50102 ResourceTypeExt extends "Resource Type"
{
    value(50100; Room)
    {
    }
}
table 50103 BookingLine
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; LineNo; Integer) { Editable = false; }
        field(2; BookingNo; Code[10]) { Editable = false; }

        field(3; HouseNo; Code[20])
        {
            TableRelation = Resource where(Type = const(Room));
            ValidateTableRelation = true;
            trigger OnValidate()
            var
                Room: Record Resource;
            begin
                Room.Get(HouseNo);
                Room.TestField(Name);
                Room.TestField("Unit Price");
                HouseName := Room.Name;
                CostPerUnit := Room."Unit Price";

            end;
        }
        field(4; HouseName; Text[100]) { Editable = false; }
        field(5; CostPerUnit; Decimal) { Editable = false; }

        field(6; NoOfNights; Integer)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                LineTotal := NoOfNights * CostPerUnit;
            end;
        }

        field(7; LineTotal; Decimal) { Editable = false; }
    }

    keys
    {
        key(pk; BookingNo, LineNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}

/*
Booking Line

LineNo : Integer
BookingNo : Code 10
House Booked : Resource type : Resource : Room
Cost Per Unit : Decimal
No of Days : Int;
Line Total : Dec;
*/
