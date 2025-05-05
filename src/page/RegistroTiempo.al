page 50104 "Registro de tiempo"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Registro de tiempo";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Linea Registro"; Rec."Linea Registro")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Proyecto; Rec.Proyecto)
                {
                    ApplicationArea = All;
                }
                field("Tarea del proyecto"; Rec."Tarea del proyecto")
                {
                    ApplicationArea = All;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }
                field("Usuario impicado"; Rec."Usuario impicado")
                {
                    ApplicationArea = All;
                }
                field("Horas registradas"; Rec."Horas registradas")
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

                trigger OnAction()
                begin

                end;
            }
        }
    }
    procedure SetProyecto(pProyecto: Code[20])
    var
        RegistroTiempo: Record "Registro de tiempo";
    begin
        RegistroTiempo.SetRange(Proyecto, pProyecto);
        CurrPage.SetTableView(RegistroTiempo);
        CurrPage.Run();
    end;

}