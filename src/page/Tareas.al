page 50103 "Tareas del proyecto"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Tarea de Proyecto";

    layout
    {
        area(Content)
        {
            field("Numero de tarea"; Rec."Numero de tarea")
            {
                ApplicationArea = AlL;
            }
            field("Pertenece al proyecto"; Rec."Pertenece al proyecto")
            {
                ApplicationArea = All;
            }
            field(Finalizada; Rec.Finalizada)
            {
                ApplicationArea = All;
            }
            field(Descripcion; Rec.Descripcion)
            {
                ApplicationArea = All;
            }
            field("Horas planificadas"; Rec."Horas planificadas")
            {
                ApplicationArea = All;
            }
            field("Usuario asignado"; Rec."Usuario asignado")
            {
                ApplicationArea = All;
            }
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
    trigger OnOpenPage()
    var
        Proyecto: Record "Proyecto";
    begin
        Rec.SetRange("Pertenece al proyecto", Proyecto."N Proyecto");
    end;
}