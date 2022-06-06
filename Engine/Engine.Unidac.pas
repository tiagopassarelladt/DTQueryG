unit Engine.Unidac;

interface

uses Engine.Interfaces, System.Classes, Data.DB, uni;

type
  TEngineUnidac = class(TInterfacedObject, IEngineBase)
  private
    FConexao: TUniConnection;
    FQry: TUniQuery;
    FParams: TParams;
  public
    constructor Create(aConexao: TUniConnection);
    destructor Destroy; override;
    class function New(aConexao: TUniConnection): IEngineBase;

    function SQL: TStrings;
    function Params: TParams;
    function ParamByName(const Value: string): TParam;
    function ExecSQL: IEngineBase;
    function DataSet: TDataSet;
    function Open( aSQL: string ): IEngineBase; overload;
    function Open: IEngineBase; overload;
    function Close: IEngineBase;
    function TableName(aValue: string): IEngineBase;
    function StartTransaction: IEngineBase;
    function Commit: IEngineBase;
    function Rollback: IEngineBase;
    function InTransaction: Boolean;
    function Eof: Boolean;
    function Next: IEngineBase;
    function Prior: IEnginebase;
    function First: IEnginebase;
    function Last: IEngineBase;
    function RecordCount: Integer;
    function Fields: TFields;
    function FieldByName(const FieldName: string): TField;
    function isEmpty: Boolean;
    function Activex(const value:boolean): boolean;
  end;

implementation

uses
  System.SysUtils;

{ TEngineUnidac }


function TEngineUnidac.Activex(const value:boolean): boolean;
begin
FQry.Active := value;
result      := value;
end;


function TEngineUnidac.Close: IEngineBase;
begin
  Result := Self;
  FQry.Close;
end;

function TEngineUnidac.Commit: IEngineBase;
begin
  Result := Self;
  FConexao.Commit;
end;

constructor TEngineUnidac.Create(aConexao: TUniConnection);
begin
  FConexao := aConexao;
  FQry := TUniQuery.Create( nil );
  FQry.Connection := FConexao;
end;

function TEngineUnidac.DataSet: TDataSet;
begin
  Result := TDataSet( FQry );
end;

destructor TEngineUnidac.Destroy;
begin
  if FQry.Active then
    Fqry.Close;

  FreeAndNil( Fqry );

  if Assigned( FParams ) then
    FreeAndNil( FParams );

  inherited;
end;

function TEngineUnidac.Eof: boolean;
begin
result := FQry.Eof;
end;

function TEngineUnidac.ExecSQL: IEngineBase;
begin
  Result := Self;
  FQry.Params.Assign( FParams );
  FQry.Prepare;
  FQry.ExecSQL;

  if Assigned( FParams ) then
    FreeAndNil( FParams );
end;

function TEngineUnidac.FieldByName(const FieldName: string): TField;
begin
   Result := FQry.FieldByName(FieldName);
end;

function TEngineUnidac.Fields: TFields;
begin
   Result := FQry.Fields;
end;

function TEngineUnidac.First: IEnginebase;
begin
   Result := Self;
   FQry.First;
end;

function TEngineUnidac.InTransaction: Boolean;
begin
  Result := FConexao.InTransaction;
end;

function TEngineUnidac.isEmpty: Boolean;
begin
   Result := fqry.IsEmpty;
end;

function TEngineUnidac.Last: IEngineBase;
begin
   Result := Self;
   FQry.Last;
end;

class function TEngineUnidac.New(aConexao: TUniConnection): IEngineBase;
begin
  Result := Self.Create(aConexao);
end;

function TEngineUnidac.Next: IEngineBase;
begin
result := Self;
FQry.Next;
end;

function TEngineUnidac.Open(aSQL: string): IEngineBase;
begin
  Result := Self;
  FQry.Close;
  FQry.SQL.Clear;
  FQry.SQL.Add( aSQL );
  FQry.Open;
end;

function TEngineUnidac.Open: IEngineBase;
begin
  Result := Self;
  FQry.Close;

  if Assigned( FParams )  then
    FQry.Params.Assign( FParams );

  FQry.Prepare;
  FQry.Open();

  if Assigned( FParams ) then
    FreeAndNil( FParams );
end;

function TEngineUnidac.ParamByName(const Value: string): TParam;
begin
   if not Assigned(FParams) then
    begin
      FParams := TParams.Create( nil );
      FParams.Assign( FQry.Params );
    end;

    Result := FParams.ParamByName(Value);
end;

function TEngineUnidac.Params: TParams;
begin
  if not Assigned(FParams) then
  begin
    FParams := TParams.Create( nil );
    FParams.Assign( FQry.Params );
  end;

  Result := FParams;
end;

function TEngineUnidac.Prior: IEnginebase;
begin
  Result := Self;
  FQry.Prior;
end;

function TEngineUnidac.RecordCount: Integer;
begin
    Result := FQry.RecordCount;
end;

function TEngineUnidac.Rollback: IEngineBase;
begin
  Result := Self;
  FConexao.Rollback;
end;

function TEngineUnidac.SQL: TStrings;
begin
  Result := FQry.SQL;
end;

function TEngineUnidac.StartTransaction: IEngineBase;
begin
  Result := Self;
  FConexao.StartTransaction;
end;

function TEngineUnidac.TableName(aValue: string): IEngineBase;
begin
  Result := Self;
end;

end.

