report 50101 "Informe de Proyectos"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'InformeProyectos.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Proyecto; Proyecto)
        {
            column(N_Proyecto; "N Proyecto") { }
            column(Fecha_inicio; "Fecha inicio") { }
            column(Fecha_fin; "Fecha fin") { }
            column(Estado; Estado) { }
            column(Cliente_Asociado; "Cliente Asociado") { }
            column(TareasFinalizadas; "% TareasFinalizadas") { }

            dataitem("Tarea de Proyecto"; "Tarea de Proyecto")
            {
                DataItemLink = "Pertenece al proyecto" = field("N Proyecto");
                column(Numero_de_tarea; "Numero de tarea") { }
                column(Pertenece_al_proyecto; "Pertenece al proyecto") { }
                column(Descripcion_Tarea; Descripcion) { }
                column(Horas_planificadas; "Horas planificadas") { }
                column(Usuario_asignado; "Usuario asignado") { }
                column(Finalizada; Finalizada) { }

                dataitem("Registro de tiempo"; "Registro de tiempo")
                {
                    DataItemLink = "Tarea del proyecto" = field("Numero de tarea");
                    column(Proyecto_Asociado; Proyecto) { }
                    column(Tarea_del_proyecto; "Tarea del proyecto") { }
                    column(Horas_registradas; "Horas registradas") { }
                    column(Descripcion; Descripcion) { }
                    column(Usuario_impicado; "Usuario impicado") { }
                }
                //
            }
            trigger OnPreDataItem()
            begin
                if (proyect <> '') then begin
                    SetRange("N Proyecto", proyect);
                end;
            end;
        }

    }
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(Filtros)
                {
                    field("Filtrar por proyecto"; proyect)
                    {
                        ApplicationArea = All;
                        TableRelation = Proyecto."N Proyecto";
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }



    var
        proyect: Code[20];
}