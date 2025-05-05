table 50100 Proyecto
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "N Proyecto"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Fecha inicio"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Fecha fin"; Date)

        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ("Fecha inicio" > "Fecha fin")
                then
                    Error('La fecha de inicio no puede ser posterior a la de fin');
            end;
        }
        field(4; Estado; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Planning,Active,Completed,Cancelled;
        }

        field(5; "Cliente Asociado"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(6; "% TareasFinalizadas"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnLookup()
            var
                contador: Integer;
                tarea: Record "Tarea de Proyecto";
            begin
                if tarea.FindSet()
                then
                    repeat
                        if (tarea.Finalizada) then begin
                            contador += 0.5;
                            "% TareasFinalizadas" := contador;
                        end;
                    until tarea.Next() = 0;

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

    fieldgroups
    {
        // Add changes to field groups here
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