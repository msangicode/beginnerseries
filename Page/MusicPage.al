page 50100 MusicPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Music;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(MusicID; Rec.MusicID)
                {
                    ApplicationArea = All;

                }
                field(MusicDescription; Rec.MusicDescription)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}

page 50101 MusicList
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
                field(MusicID; Rec.MusicID)
                {
                    ApplicationArea = All;

                }
                field(MusicDescription; Rec.MusicDescription)
                {

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
