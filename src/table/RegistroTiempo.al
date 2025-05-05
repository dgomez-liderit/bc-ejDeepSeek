table 50102 "Registro de tiempo"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Linea Registro"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Tarea del proyecto"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tarea de Proyecto";
        }
        field(3; "Usuario impicado"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }

        field(4; "Horas registradas"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Descripcion"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Linea Registro")
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