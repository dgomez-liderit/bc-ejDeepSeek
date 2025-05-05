table 50100 Proyecto
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "N Proyecto"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Fecha inicio"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Fecha fin"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Fecha inicio" > "Fecha fin") then
                    Error('La fecha de inicio no puede ser posterior a la de fin');
            end;
        }
        field(4; Estado; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Planning,Active,Completed,Cancelled;
        }
        field(5; "Cliente Asociado"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(6; "% TareasFinalizadas"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
            DecimalPlaces = 0 : 2;

            trigger OnValidate()
            begin
                // Se calcula automáticamente con una función
                "% TareasFinalizadas" := CalculateCompletionPercentage();
            end;
        }
    }

    keys
    {
        key(PK; "N Proyecto")
        {
            Clustered = true;
        }
    }

    procedure CalculateCompletionPercentage(): Decimal
    var
        Tarea: Record "Tarea de Proyecto";
        TareasTotales: Integer;
        TareasCompletadas: Integer;
    begin
        Tarea.SetRange("Pertenece al proyecto", "N Proyecto");
        TareasTotales := Tarea.Count();

        Tarea.SetRange(Finalizada, true);
        TareasCompletadas := Tarea.Count();

        if TareasTotales = 0 then
            exit(0);

        exit((TareasCompletadas / TareasTotales) * 100);
    end;

}