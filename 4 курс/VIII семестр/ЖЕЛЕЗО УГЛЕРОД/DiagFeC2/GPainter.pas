unit GPainter;

interface
uses classes, Graphics, Types, Contnrs, SysUtils;

type TCoord = packed record
   X: Double;
   Y: Double;
end;
function Coord(X,Y:Double):TCoord;

Type TGraphicObject=Class(TObject)
public
  Canvas:TCanvas;
  ObjType: string;
  Name: string;
  Points: array of TPoint;
  Coords: array of TCoord;
  BgColor:TColor;
  Constructor Create(cCanvas: TCanvas; cName:string);
  procedure Draw;virtual; abstract;
  procedure SetCoords(cCoords:array of TCoord);
end;

Type TPolygon=Class(TGraphicObject)
public
  Constructor Create(cCanvas: TCanvas; cName:string);
  procedure Draw;override;
end;

Type TPolyLine=Class(TGraphicObject)
public
  Constructor Create(cCanvas: TCanvas; cName:string);
  procedure Draw;override;
end;

Type TText=Class(TGraphicObject)
public
  Constructor Create(cCanvas: TCanvas; cName:string);
  procedure Draw;override;
end;

Type TGraphicPainter=Class(TObject)
private
  mCanvas: TCanvas;
public
  Xmin,Xmax: Double;
  Ymin,Ymax: Double;
  Width,Height: integer;
  leftMargin, rightMargin, topMargin, bottomMargin: integer;
  xStep,yStep: Double;
  Figures: TObjectList;
  isDrawNet: Boolean;
  Constructor Create(cCanvas: TCanvas);
  property Canvas:TCanvas read mCanvas;
  function toX(x:Double):Integer;
  function toY(y:Double):Integer;
  function fromX(x:Integer):Double;
  function fromY(y:Integer):Double;
  function P(x,y:Double):TPoint; // ������� ��������� � ��������
  procedure SetXRange(min,max:Double);
  procedure SetYRange(min,max:Double);
  procedure SetSize(w,h:integer);
  procedure SetMargins(lMargin, tMargin, rMargin, bMargin: integer);
  procedure SetSteps(x,y:Double);
  procedure DrawNet;
  procedure DrawFigures;
  procedure AddPolygon(Name:string; Coords:array of TCoord; Color:TColor);
  procedure AddPolyLine(Name:string; Coords:array of TCoord);
  procedure AddText(Name:string; Coord: TCoord);
  procedure Repaint;
  procedure ConvertCtoP(Coords:array of TCoord;var Points:array of Tpoint);
end;

implementation

function Coord(X,Y:Double):TCoord;
begin
  Result.X := X;
  Result.Y := Y;
end;

/////////////////////////
///  TGraphicObject
/////////////////////////

Constructor TGraphicObject.Create(cCanvas: TCanvas; cName:string);
begin
  Canvas := cCanvas;
  Name := cName;
end;

procedure TGraphicObject.SetCoords(cCoords:array of TCoord);
var i:integer;
begin
  SetLength(Coords,High(cCoords)+1);
  for i := 0 to High(cCoords) do
  begin
    Coords[i] := cCoords[i]
  end;
end;

/////////////////////////
///  TPolygon
/////////////////////////

Constructor TPolygon.Create(cCanvas: TCanvas; cName:string);
begin
  inherited;
  ObjType := 'Polygon';
end;

procedure TPolygon.Draw;
begin
  Canvas.Brush.Color := BgColor;
  Canvas.Polygon(Points);
  Canvas.Brush.Color := clBlack;
end;

/////////////////////////
///  TPolyLine
/////////////////////////

Constructor TPolyLine.Create(cCanvas: TCanvas; cName:string);
begin
  inherited;
  ObjType := 'PolyLine';
end;

procedure TPolyLine.Draw;
begin
  Canvas.Polyline(Points);
end;

/////////////////////////
///  TText
/////////////////////////

Constructor TText.Create(cCanvas: TCanvas; cName:string);
begin
  inherited;
  ObjType := 'Text';
end;

procedure TText.Draw;
var X,Y:Integer;
    OldStyle:TBrushStyle;
begin
   X:=Points[0].X;
   Y:=Points[0].Y;
   X:=X - Round(Canvas.TextWidth(Name)/2);
   Y:=Y - Round(Canvas.TextHeight(Name)/2);

   OldStyle := Canvas.Brush.Style;
   Canvas.Brush.Style := bsClear;
   Canvas.TextOut(X,Y,Name);
   Canvas.Brush.Style := OldStyle;
end;

/////////////////////////
///  TGraphicPainter
/////////////////////////

Constructor TGraphicPainter.Create(cCanvas: TCanvas);
begin
  mCanvas := cCanvas;
  SetMargins(40,5,5,15);
  isDrawNet:=True;
  Figures:=TObjectList.Create;
end;

procedure TGraphicPainter.DrawNet;
var cX,cY:Double;
    X,Y:Integer;
    i:integer;
    OldWidth:integer;
    OldStyle:TPenStyle;
    OldColor:TColor;
    OldFontSize:integer;
    OldFontStyle:TFontStyles;
begin
  with mCanvas do
  begin
    OldWidth := Canvas.Pen.Width;
    OldStyle := Canvas.Pen.Style;
    OldColor := Canvas.Pen.Color;
    OldFontSize := Canvas.Font.Size;
    OldFontStyle := Canvas.Font.Style;

    Canvas.Pen.Style := psDot;
    Canvas.Pen.Color := clGray;
    Canvas.Font.Size := 8;
    Canvas.Font.Style := [ ];
    //�����
    for i := 1 to Trunc((Xmax-Xmin)/xStep) do
        begin
          if isDrawNet then Polyline([P(Xmin + xStep*i,Ymin),P(Xmin + xStep*i,Ymax)]);
          X:=P(Xmin + xStep*i,Ymin).X - TextWidth(FloatToStr(Xmin + xStep*i)) div 2;
          Y:=P(Xmin + xStep*i,Ymin).Y;
          TextOut(X,Y,FloatToStr(Xmin + xStep*i));
        end;

    for i := 1 to Trunc((Ymax-Ymin)/yStep) do
        begin
          if isDrawNet then Polyline([P(Xmin,Ymin + yStep*i),P(Xmax,Ymin + yStep*i)]);
          X:=P(Xmin,Ymin + yStep*i).X - TextWidth(FloatToStr(Ymin + yStep*i)) - 5;
          Y:=P(Xmin,Ymin + yStep*i).Y - TextHeight(FloatToStr(Ymin + yStep*i)) div 2;
          TextOut(X,Y,FloatToStr(Ymin + yStep*i));
        end;

    Canvas.Pen.Style:=OldStyle;
    Canvas.Pen.Color := OldColor;   
    Canvas.Font.Size := OldFontSize;
    Canvas.Font.Style := OldFontStyle;

    Canvas.Pen.Width := 2;
    //�����
    if Xmin>0 then cX:=Xmin else cX := 0;
    if Ymin>0 then cY:=Ymin else cY := 0;

    Polyline([P(Xmin,cY),P(Xmax,cY)]);
    Polyline([P(cX,Ymin),P(cX,Ymax)]);

    //�������
    Polyline([Point(toX(Xmax)-5,toY(cY)-3),P(Xmax,cY),Point(toX(Xmax)-5,toY(cY)+3)]);
    Polyline([Point(toX(cX)-3,toY(Ymax)+5),P(cX,Ymax),Point(toX(cX)+3,toY(Ymax)+5)]);

    Canvas.Pen.Width := OldWidth;
  end;
end;

procedure TGraphicPainter.DrawFigures;
var i:integer;
    buf:TGraphicObject;
begin
  for i := 0 to Figures.Count - 1 do
    begin
      buf:=(Figures[i] as TGraphicObject);
      ConvertCtoP(buf.Coords,buf.Points);
      buf.Draw;
    end;
end;

procedure TGraphicPainter.ConvertCtoP(Coords:array of TCoord;var Points:array of Tpoint);
var i:integer;
begin
  for i := 0 to High(Coords) do
  begin
    Points[i] := P(Coords[i].X,Coords[i].Y);
  end;
end;

procedure TGraphicPainter.AddPolygon(Name:string; Coords:array of TCoord; Color:TColor);
var buf:TPolygon;
begin
   buf:=TPolygon.Create(mCanvas,Name);
   buf.SetCoords(Coords);
   SetLength(buf.Points, High(Coords)+1);
   buf.BgColor := Color;
   Figures.Add(buf);
end;

procedure TGraphicPainter.AddPolyLine(Name:string; Coords:array of TCoord);
var buf:TPolyLine;
begin
   buf:=TPolyLine.Create(mCanvas,Name);
   buf.SetCoords(Coords);
   SetLength(buf.Points, High(Coords)+1);
   Figures.Add(buf);
end;

procedure TGraphicPainter.AddText(Name:string; Coord: TCoord);
var buf:TText;
begin
   buf:=TText.Create(mCanvas,Name);
   buf.SetCoords([Coord]);
   SetLength(buf.Points, 1);
   Figures.Add(buf);
end;

procedure TGraphicPainter.Repaint();
begin
  // �������
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  // �����
  DrawNet;

  // ������
  DrawFigures;
end;

procedure TGraphicPainter.SetXRange(min,max:Double);
begin
  Xmin:=min;
  Xmax:=max;
end;

procedure TGraphicPainter.SetYRange(min,max:Double);
begin
  Ymin:=min;
  Ymax:=max;
end;

procedure TGraphicPainter.SetSize(w,h:integer);
begin
  Width := w;
  Height := h;
end;

procedure TGraphicPainter.SetMargins(lMargin, tMargin, rMargin, bMargin: integer);
begin
  leftMargin:=lMargin;
  topMargin:=tMargin;
  rightMargin:=rMargin;
  bottomMargin:=bMargin;
end;

procedure TGraphicPainter.SetSteps(x,y:Double);
begin
  xStep:=x;
  yStep:=y;
end;

function TGraphicPainter.toX(x:Double):Integer;
begin
  Result := Round(leftMargin + (x-Xmin)*(Width-(leftMargin+rightMargin))/(Xmax-Xmin));
end;

function TGraphicPainter.toY(y:Double):Integer;
begin
  Result := Round(Height - bottomMargin - (y-Ymin)*(Height-(bottomMargin+topMargin))/(Ymax-Ymin));
end;

function TGraphicPainter.P(x,y:Double):TPoint;
begin
  Result := Point(toX(x),toY(y));
end;

function TGraphicPainter.fromX(x:Integer):Double;
begin
  Result := (x-leftMargin)*(Xmax-Xmin)/(Width-(leftMargin+rightMargin)) + Xmin;
end;

function TGraphicPainter.fromY(y:Integer):Double;
begin
  Result := (Height-y-bottomMargin)*(Ymax-Ymin)/(Height-(bottomMargin+topMargin)) + Ymin;
end;

end.
