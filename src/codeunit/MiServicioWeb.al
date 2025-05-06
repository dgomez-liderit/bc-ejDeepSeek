codeunit 50101 "MiServicioWeb"
{

    [ServiceEnabled]
    procedure ObtenerSaludo(Nombre: Text): Text
    begin
        exit('Hola ' + Nombre + ' desde Business Central!');
    end;

    [ServiceEnabled]
    procedure SumarNumeros(Numero1: Integer; Numero2: Integer): Integer
    begin
        exit(Numero1 + Numero2);
    end;
}