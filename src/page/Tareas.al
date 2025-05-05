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



    procedure RegistrarTiempoDesdePadre()
    var
        RegistroTiempo: Record "Registro de tiempo";
        PaginaRegistro: Page "Registro de tiempo";
    begin
        if Rec.IsEmpty then
            Error('No hay tarea seleccionada.');

        RegistroTiempo.Init();
        RegistroTiempo."Tarea del proyecto" := Rec."Numero de tarea";
        RegistroTiempo."Usuario impicado" := Rec."Usuario asignado";
        RegistroTiempo.Descripcion := Rec.Descripcion;
        RegistroTiempo.Proyecto := Rec."Pertenece al proyecto";
        RegistroTiempo.Insert();
        PaginaRegistro.SetProyecto(Rec."Pertenece al proyecto");

    end;

}