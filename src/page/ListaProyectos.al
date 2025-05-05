page 50101 "Lista de proyectos"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Proyecto;
    CardPageId = "Ficha de proyecto";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Abrir Ficha")
            {

                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = GoTo;
                RunObject = page "Ficha de proyecto";
                RunPageMode = View;
                RunPageLink = "N Proyecto" = field("N Proyecto");
            }
        }
    }
}