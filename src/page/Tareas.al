page 50103 "Tareas del proyecto"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Tarea de Proyecto";
    Caption = 'Tareas del Proyecto';
    InsertAllowed = true;
    DeleteAllowed = true;
    LinksAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Numero de tarea"; Rec."Numero de tarea")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Pertenece al proyecto"; Rec."Pertenece al proyecto")
                {
                    ApplicationArea = All;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }

                field(Finalizada; Rec.Finalizada)
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
    }

    actions
    {
        area(Processing)
        {
            action("Registrar Tiempo")
            {
                ApplicationArea = All;
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    RegistroTiempo: Record "Registro de tiempo";
                    PaginaRegistro: Page "Registro de tiempo";
                begin
                    RegistroTiempo.Init();
                    RegistroTiempo."Tarea del proyecto" := Rec."Numero de tarea";
                    // RegistroTiempo."Pertenece al proyecto" := Rec."Pertenece al proyecto";
                    PaginaRegistro.SetRecord(RegistroTiempo);
                    PaginaRegistro.RunModal();
                end;
            }
        }
    }

    // local procedure GetHorasRegistradas(): Decimal
    // var
    //     RegistroTiempo: Record "Registro de tiempo";
    // begin
    //     RegistroTiempo.SetRange("Tarea del proyecto", Rec."Numero de tarea");
    //     RegistroTiempo.SetRange(Po, Rec."Pertenece al proyecto");
    //     if RegistroTiempo.FindSet() then
    //         repeat
    //             Result += RegistroTiempo."Horas registradas";
    //         until RegistroTiempo.Next() = 0;

    //     exit(Result);
    // end;
}