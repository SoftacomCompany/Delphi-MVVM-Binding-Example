unit ViewModel;

interface

uses
  FMX.ImgList, FMX.Graphics, FMX.Objects, Generics.Collections, Model;

type TViewModel = class
  private
    FImageList: TList<TBitmap>;
    FImageIndex: Integer;
    FIdx: Integer;
    FLastIdx: Integer;
    function GetModelImageByIndex: TBitmap;
    function GetImageIndex: Integer;
  public
    procedure SetImageIndex(AIndex: Integer);
    function GetModelImages: TList<TBitmap>;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex;
    property ModelImageByIdx: TBitmap read GetModelImageByIndex;
end;

implementation

{ TViewModel }

function TViewModel.GetImageIndex: Integer;
begin
  Result:= Random(9999);
end;

function TViewModel.GetModelImageByIndex: TBitmap;
begin
  if FImageIndex = 0 then
  begin
    if FIdx < Length(GetModelImages.ToArray) then
    begin
      Result := GetModelImages[FIdx];
      Inc(FIdx);
      GetModelImages.Reverse;
    end;
  end
  else
    GetModelImages[FImageIndex];
  if GetModelImages[FIdx] = GetModelImages.Last then
  begin
    FIdx := 0;
    GetModelImages.Reverse;
  end
end;

procedure TViewModel.SetImageIndex(AIndex: Integer);
begin
  FImageIndex := AIndex;
end;

function TViewModel.GetModelImages: TList<TBitmap>;
begin
  var lModel: TModel := TModel.Create;
  if Assigned(FImageList) then
    Result := FImageList
  else
  begin
    Result := TList<TBitmap>.Create;
    for var i: integer := 1 to lModel.GetModelDataCount do
    begin
      var lBmp: TBitmap := TBitmap.Create;
      var lMemStream := lModel.GetModelDataStream(i);
      lBmp.LoadFromStream(lMemStream);
      Result.Add(lBmp);
      lMemStream.Free;
    end;
    FImageList := Result;
  end;
  lModel.Free;
end;

end.
