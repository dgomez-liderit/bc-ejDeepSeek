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
            trigger OnValidate()
            var
                Proyecto: Record "Proyecto";
                tarea: Record "Tarea de Proyecto";
            begin
                tarea.Get(Rec."Tarea del proyecto");
                Proyecto.Get(tarea."Pertenece al proyecto");
                Rec.Proyecto := Proyecto."N Proyecto";
            end;
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
        field(6; "Proyecto"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Proyecto;
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