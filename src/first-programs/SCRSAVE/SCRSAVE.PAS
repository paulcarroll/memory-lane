        program ScrSave;
        uses Graph, Crt;
        const
             Step2 = 3;
             Step3 = 2;
        var
           Gmode, Gdriver, ErrorCode, X1, X2, Y1, Y2, Col: Integer;
           i: Boolean;
           Ch: Char;
        procedure SetScreen;
        begin
             SetFillStyle(9,Blue);
             Bar(0,50,30,GetMaxY-50);
             Bar(GetMaxX-30,50,GetMaxX,GetMaxY-50);
             SetFillStyle(1,Green);
             Bar(0,0,GetMaxX,50);
             Bar(0,GetMaxY-100,GetMaxX,GetMaxY);
             SetTextJustify(1,1);
             SetTextStyle(4,0,5);
             SetColor(Blue);
             OutTextXY((GetMaxX) div 2,15,'A Sample Screen Saver....');
             SetTextStyle(4,0,4);
             OutTextXY((GetMaxX) div 2,(GetMaxY) - 80,'Programmed in Turbo Pascal 6.0 by');
             SetTextStyle(4,0,5);
             OutTextXY((GetMaxX) div 2,(GetMaxY) - 35,'Paul Carroll.');
        end;

        begin
             Gdriver := Detect;
             InitGraph(Gdriver,Gmode,'\tp\bgi');
             ErrorCode := GraphResult;
             If ErrorCode <> GrOk then
             begin
                  Writeln('Critical Graphics Error:',GraphErrorMsg(ErrorCode));
                  Halt(1);
             end;
             SetScreen;
             SetColor(Black);
             X1:=30;Y1:=50;X2:=GetMaxX-30;Y2:=GetMaxY-100;
             SetWriteMode(XORPut);
             rectangle(X1,Y1,X2,Y2);
             delay(20);
             rectangle(x1,y1,x2,y2);
             i:=false;
             repeat
                   while (Y1 < GetMaxY-100) and (Y2 > 50) do
                   begin
                        SetColor(col);
                        inc(col);
                        Inc(Y1,Step2);
                        Dec(Y2,Step2);
                        if i = false then
                        begin
                             inc(x1,step3);
                             dec(x2,step3);
                        end;
                        rectangle(X1,Y1,X2,Y2);
                        Delay(20);
                        rectangle(X1,Y1,X2,Y2);
                        if (x1>GetMaxX-30) or (X2>GetMaxX-30) or (x1<30) or (x2<30) then i := True;
                        if i then
                        begin
                             dec(x1,step3);
                             inc(x2,step3);
                        end;
                        if x1=30 then i := False;
                        if keypressed then
                        begin
                             ch := readkey;
                             closegraph;
                             halt(1);
                        end;
                   end;
                   while (Y1<>50) and (Y2<>GetMaxY-100) do
                   begin
                        SetColor(col);
                        inc(col);
                        dec(Y1,step2);
                        Inc(Y2,step2);
                        if i = false then
                        begin
                             inc(x1,step3);
                             dec(x2,step3);
                        end;
                        rectangle(x1,y1,x2,y2);
                        delay(20);
                        rectangle(x1,y1,x2,y2);
                        if (x1>GetMaxX-30) or (X2>getMaxX-30) or (x1<30) or(x2<30) then i := True;
                        if i then
                        begin
                             dec(x1,step3);
                             inc(x2,step3);
                        end;
                        if x1=30 then i := False;
                        if keypressed then
                        begin
                             ch := readkey;
                             closegraph;
                             halt(1);
                        end;
                   end;
             until KeyPressed;
             ch := readkey;
             closegraph;
        end.