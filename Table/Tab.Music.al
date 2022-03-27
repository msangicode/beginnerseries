table 50100 Music
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MusicID; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; MusicDescription; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; Artist; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where(Type =
             Const(Machine));
        }
    }

    keys
    {
        key(Pk; MusicID)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        RType: Enum "Resource Type";

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

page 50113 Meza
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Music;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Music ID"; Rec.MusicID)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}