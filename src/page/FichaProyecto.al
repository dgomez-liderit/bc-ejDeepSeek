page 50102 "Ficha de proyecto"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Proyecto;


    layout
    {
        area(Content)
        {
            group(Proyecto)
            {
                field("N Proyecto"; Rec."N Proyecto")
                {
                    ApplicationArea = All;
                }
                field("Cliente Asociado"; Rec."Cliente Asociado")
                {

                }
                field("Fecha inicio"; Rec."Fecha inicio")
                {
                    ApplicationArea = All;
                }
                field("Fecha fin"; Rec."Fecha fin")
                {
                    ApplicationArea = All;
                }
                field(Estado; Rec.Estado)
                {
                    ApplicationArea = All;
                }
                field("% TareasFinalizadas"; Rec."% TareasFinalizadas")
                {
                    ApplicationArea = All;
                }
            }
            group(Tareas)
            {
                part(TareasPart; "Tareas del proyecto")
                {

                    ApplicationArea = All;
                    SubPageLink = "Pertenece al proyecto" = field("N Proyecto");
                }
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
}