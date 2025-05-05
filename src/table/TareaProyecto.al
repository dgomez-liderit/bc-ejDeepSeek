table 50101 "Tarea de Proyecto"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Numero de tarea"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }

        field(2; Descripcion; Text[150])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Horas planificadas"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Usuario asignado"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(5; "Pertenece al proyecto"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Proyecto;
        }
        field(6; Finalizada; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Numero de tarea")
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