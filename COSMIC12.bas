10 REM TITLE SCREEN
20 MODE 7
30 VDU 23,1,0;0;0;0;
40 DIM Scores%(9),Names$(9),Space%(7,5),Bombs%(10,1),Alien0$(1),Alien1$(1),Alien2$(1), Ch% 3
50 REM **** Special Characters ****
60 BL$=CHR$(255) : REM Block
70 D$=CHR$(10) : REM Cursor Down
80 B$=CHR$(8) : REM Cursor Back
90 GR$=CHR$(145) : REM Red graphics
100 REM *** COLOUR CHARACTERS ***
110 L$=CHR$(141) : R$=CHR$(129) : G$=CHR$(130)
120 Y$=CHR$(131) : B$=CHR$(132) : M$=CHR$(133)
130 C$=CHR$(134) : FL$=CHR$(136) : ST$=CHR$(137)
140 REM *** SPECIAL CHARACTERS ***
150 BL$=CHR$(255) : REM Block
160 B$=CHR$(8) : REM Cursor Back
170 F$=CHR$(9) : REM Cursor Forward
180 D$=CHR$(10) : REM Cursor Down
190 U$=CHR$(11) : REM Cursor Up
200 REM *** GRAPHIC COLOUR CHAR'S ***
210 GR$=CHR$(145) : GG$=CHR$(146) : GY$=CHR$(147) : GC$=CHR$(150)
220 REM **** Space Invader A ****
230 Alien0$(0)=">"+BL$+"m "+D$+B$+B$+B$+B$+"k/7 "+D$+B$+B$+B$+B$+"! "" "
240 Alien0$(1)=">"+BL$+"m "+D$+B$+B$+B$+B$+"k/7 "+D$+B$+B$+B$+B$+"  " 
250 REM **** Space Invader B **** 
260 Alien1$(0)="ypv "+D$+B$+B$+B$+B$+"m"+BL$+"> "+D$+B$+B$+B$+B$+"! "" " 
270 Alien1$(1)="ypv "+D$+B$+B$+B$+B$+"m"+BL$+"> "+D$+B$+B$+B$+B$+" "
280 REM **** Space Invader C ****
290 Alien2$(0)="ypv "+D$+B$+B$+B$+B$+"m/> "+D$+B$+B$+B$+B$+"! "" "
300 Alien2$(1)="ypv "+D$+B$+B$+B$+B$+"m/> "+D$+B$+B$+B$+B$+" ` "
310 REM **** Blank Invader ****
320 Blank1$=" "+D$+B$+B$+B$+B$+" "+D$+B$+B$+B$+B$+" "
330 Blank2$=" "+D$+B$+B$+B$+B$+B$+" "+D$+B$+B$+B$+B$+B$+" "
340 REM **** Blank Invader Side ****
350 Blank_Line$=F$+F$+F$+" "+D$+B$+" "+D$+B$+" "
360 REM **** Your Base ****
370 Base$=" p^p "
380 REM **** Shield ****
390 Shield$=BL$+BL$+BL$+D$+B$+B$+B$+BL$+BL$+BL$+D$+B$+B$+B$+BL$+BL$+BL$
400 REM **** Mystery ****
410 Mystery$=" ns="
415 PROC_Initialize
420 REM Main Program
430 REPEAT : finish=FALSE
440 PRINTTAB(13)CHR$(141)CHR$(131);"COSMIC INVADERS"
450 PRINTTAB(13)CHR$(141)CHR$(134);"COSMIC INVADERS"
460 PRINT
470 PRINT
480 PRINTTAB(15)CHR$(130);GR$;Alien1$(0)
490 PRINTTAB(15)CHR$(132);GR$;Alien1$(1)
500 PRINT
510 PRINT
520 PRINT CHR$129;"Instructions for use :-"
530 PROCTitle_Music
540 PRINT
550 PRINT CHR$134;" The object of the game is to"
560 PRINT CHR$134;"shoot the cosmic aliens from the sky to";
570 PRINT CHR$134;"save the world."
580 PRINT
590 PRINT CHR$134;"Press the following keys for use :-"
600 PRINT
610 PRINT'" Z - To move left"
620 PRINT'" X - To move right"
630 PRINT'" SHIFT - To fire"
640 PRINT'" ESCAPE - To exit from game"
650 PRINT
660 PRINT CHR$130;"Press" CHR$133;"Space" CHR$130;"to start or 'Q' to quit."
670 REPEAT
680 A$ = INKEY$(100)
690 IF A$ = "Q" OR A$ = "q" THEN PROCGame_Over
695 PROC_Scores : PROC_Time_key
700 IF A$=" " THEN PROC_Play
705 PROC_High_Scores : PROC_Time_key
710 Start% = 0
720 Score% = 0
730 Base% = 3
740 PROC_Play
750 END
760 DEF PROCGame_Over
770 CLS
780 PRINTTAB(13)CHR$(141)CHR$(129);"GAME OVER"
790 PRINTTAB(13)CHR$(141)CHR$(132);"GAME OVER"
800 PRINT
810 PRINTTAB(13)CHR$(134);"Thanks for playing!"
820 END
830 ENDPROC
840 DEF PROCTitle_Music
850 ENVELOPE 1,1,0,0,0,20,20,20,126,-1,-1,-1,126,0
860 SOUND 1,-15,53,20 : REM Note 1
870 SOUND 1,0,0,5 : REM Short pause
880 SOUND 1,-15,65,20 : REM Note 2
890 SOUND 1,0,0,5 : REM Short pause
900 SOUND 1,-15,61,20 : REM Note 3
910 SOUND 1,0,0,5 : REM Short pause
920 SOUND 1,-15,41,20 : REM Note 4
930 SOUND 1,0,0,5 : REM Short pause
940 SOUND 1,-15,49,40 : REM Note 5 (longer duration)
950 ENDPROC
960 DEF PROC_Setup_Game
970 CLS
980 O%=0 : P%=6 : Q%=0 : R%=4 : B%=1 : Bomb%=0 : MBomb%=Start%+6 : FOR I%=0 TO 10 : Bombs%(I%,1)=0 : NEXT
990 Mystery%=FALSE : Missile%=FALSE : MissileX%=0 : MissileY%=0 : finish=FALSE : VDU 23,1,0;0;0;0;
1000 PROC_Info_Line : PROC_Colour_setup : PROC_Invader_Setup : PROC_Display_Shields : PROC_Display_Invaders : PROC_Display_Base
1010 ENDPROC

1020 DEF PROC_Info_Line
1030 PRINTTAB(0,0)G$"HS"M$;Scores%(0);
1040 PRINTTAB(20,0)G$"Score"M$;Score%;
1050 PRINTTAB(0,24);CHR$(150);
1060 FOR I%=1 TO Base%:PRINTBase$;:NEXT
1070 ENDPROC
1080 DEF PROC_Display_Shields
1090 FOR I%=0 TO 3 : PRINTTAB(5+I%*9,20);Shield$ : NEXT
1100 ENDPROC

1110 DEF PROC_Hit
1120 SOUND &0010,-15,6,5 : IF MissileY% < 22 THEN PRINTTAB(MissileX%,MissileY%+1);" "
1130 PRINTTAB(MissileX%,MissileY%); : C%=FN_Find_Char
1140 IF (MissileY%+1<=Y%+(R%+1)*3) AND (MissileX%>=X%) AND (MissileX%<X%+(P%-O%+1)*4) THEN PROC_Invader_Hit(L%) : GOTO 1170
1150 IF MissileY%=1 THEN PROC_Mystery_Hit : GOTO 1190
1160 PROC_Base_Hit
1170 I%=7
1180 IF NOT FN_Is_Line THEN finish=TRUE
1190 ENDPROC

1200 DEF PROC_Mystery_Hit
1210 PRINTTAB(MystX%,1);"     ";
1220 Score%=Score%+RND(30)*10
1230 PROC_Info_line
1240 ENDPROC

1250 DEF PROC_Base_Hit
1260 IF C%=ASC(BL$) THEN PRINT"/"; : GOTO 1290
1270 IF C%=ASC("/") THEN PRINT"`"; : GOTO 1290
1280 PRINT" ";
1290 Missile%=FALSE
1300 ENDPROC

1310 DEF PROC_Boundary_Update
1320 S%=O% : PROC_X_Boundary_Update : PROC_Y_Boundary_Update : X%=X%+(O%-S%)*4
1330 ENDPROC

1340 DEF PROC_X_Boundary_Update
1350 IF Space%(O%,5) GOTO 1370
1360 REPEAT : O%=O%+1 : UNTIL Space%(O%,5)
1370 IF P%=7 GOTO 1410
1380 IF Space%(P%,5) GOTO 1410
1390 REPEAT : P%=P%-1 : IF P%<0 THEN finish=TRUE : P%=7
1400 UNTIL Space%(P%,5)
1410 ENDPROC

1420 DEF PROC_Y_Boundary_Update
1430 IF Space%(7,Q%) GOTO 1450
1440 REPEAT : Q%=Q%+1 : UNTIL Space%(7,Q%)
1450 IF R%=5 GOTO 1490
1460 IF Space%(7,R%) GOTO 1490
1470 REPEAT : R%=R%-1 : IF R%<0 THEN finish=TRUE : R%=5
1480 UNTIL Space%(7,R%)
1490 ENDPROC


1500 DEF PROC_Invader_Hit(L%)
1510 LOCAL I%,K%
1520 IF Left% THEN G%=-1 ELSE G%=1
1530 IF MissileX% > X%+(L%-O%+1)*4 THEN I%=(MissileX%-X%+(O%*4)+G%)DIV4 ELSE I%=(MissileX%-X%+O%*4)DIV4
1540 K%=(MissileY%-Y%) DIV 3 : Space%(I%,K%)=FALSE : J%=(I%-O%)*4 : PROC_Blank(J%)
1550 IF NOT FN_Is_Line THEN Space%(I%,5)=FALSE : PROC_Boundary_Update
1560 K%=(MissileY%-Y%) DIV 3
1570 IF NOT FN_Is_Row THEN Space%(7,K%)=FALSE : PROC_Boundary_Update
1580 Missile%=FALSE : Score%=Score%+((3-((MissileY%-Y%)DIV3)DIV2)*20) : PROC_Info_Line
1590 ENDPROC

1600 DEF PROC_Colour_setup
1610 PRINTTAB(0,1);GR$;
1620 FOR I%=2 TO 7 : PRINTTAB(0,I%);GC$;TAB(0,I%+6);GR$;TAB(0,I%+12);GY$; : NEXT
1630 FOR I%=0 TO 2:PRINTTAB(0,I%+20);GG$; : NEXT : PRINT'GR$;
1640 ENDPROC

1650 DEF PROC_Display_Base
1660 PRINTTAB(B%,23);Base$
1670 ENDPROC

1680 DEF PROC_Invader_Setup
1690 FOR I%=0 TO 7 : FOR J%=0 TO 5 : Space%(I%,J%)=TRUE : NEXT : NEXT
1700 X%=10 : Y%=Start%MOD4+2 : Left%=TRUE
1710 ENDPROC

1720 DEF PROC_Fire
1730 SOUND &0012,2,0,10 : Missile%=TRUE : MissileX%=B%+2 : MissileY%=22 : PROC_Move_Missile(L%)
1740 ENDPROC
1750 DEF PROC_Move_Missile(L%)
1760 LOCAL I%,K%
1770 PRINTTAB(MissileX%,MissileY%);
1780 IF FN_Find_Char <> 32 THEN PROC_Hit : GOTO 1840
1790 PRINTTAB(MissileX%,MissileY%+1);
1800 IF MissileY%+1 <> 23 THEN PRINT" "
1810 PRINTTAB(MissileX%,MissileY%);
1820 IF MissileY%<>1 THEN PRINT"^"
1830 IF MissileY%>1 THEN MissileY%=MissileY%-1 ELSE Missile%=FALSE
1840 ENDPROC

1850 DEF PROC_Display_Invaders
1860 SOUND 1,-15,1,1 : I%=O% : M%=ABS(X% MOD 2) : REM M%=ABS((X%+I%*4)MOD 2)
1870 REPEAT : PROC_Key_Test : J%=(I%-O%)*4
1880 FOR K%=Q% TO R% : IF Space%(I%,K%) THEN PROC_Invader ELSE PROC_Blank(J%)
1890 NEXT
1900 IF Missile% THEN PROC_Move_Missile(I%)
1910 IF Mystery% THEN PROC_Move_Mystery ELSE IF RND(100)=1 THEN PROC_Start_Mystery
1920 I%=I%+1 : UNTIL I%>P% OR finish=TRUE
1930 ENDPROC
1940 DEF PROC_Key_Test
1950 IF INKEY(-98) AND NOT INKEY(-67) THEN PROC_Move_Left
1960 IF INKEY(-67) AND NOT INKEY(-98) THEN PROC_Move_Right
1970 IF INKEY(-1) AND NOT Missile% THEN PROC_Fire
1980 IF INKEY(-68) THEN REPEAT UNTIL INKEY(-54)
1990 *FX 15 1
2000 ENDPROC
2010 DEF PROC_Move_Left
2020 IF B%>1 THEN B%=B%-1
2030 PROC_Display_Base
2040 ENDPROC
2050 DEF PROC_Move_Right
2060 IF B%<34 THEN B%=B%+1
2070 PROC_Display_Base
2080 ENDPROC
2090 DEF PROC_Move_Down
2100 PRINTTAB(X%,Y%+Q%*3);STRING$((P%-O%+1)*4," "); : Y%=Y%+1 : IF Y%-(4-R%)*3=9 THEN finish=TRUE
2110 ENDPROC
2120 DEF PROC_Invader
2130 PRINTTAB(X%+J%,Y%+K%*3);
2140 ON K%+1 GOTO 2150,2150,2160,2160,2170,2180
2150 PRINT Alien2$(M%) : GOTO 2190
2160 PRINT Alien1$(M%) : GOTO 2190
2170 PRINT Alien0$(M%) : GOTO 2190
2180 finish=TRUE
2190 ENDPROC
2200 DEF PROC_Blank(J%)
2210 IF NOT Left% THEN J%=J%-1
2220 PRINTTAB(X%+J%,Y%+K%*3); : IF Left% THEN PRINTBlank1$ ELSE PRINTBlank2$
2230 ENDPROC
2240 DEF PROC_Start_Mystery
2250 MystX%=1 : Mystery%=TRUE
2260 PRINTTAB(MystX%,1);Mystery$;
2270 ENDPROC
2280 DEF PROC_Move_Mystery
2290 SOUND &13,3,20,5
2300 MystX%=MystX%+1
2310 PRINTTAB(MystX%,1);Mystery$;
2320 IF MystX%=35 THEN Mystery%=FALSE : PRINTTAB(MystX%,1);"    ";
2330 ENDPROC
2340 DEF PROC_Play
2341 Start%=0
2342 Score%=0 : Base%=3
2350 REPEAT : PROC_Setup_Game
2360 REPEAT : PROC_Key_Test : PROC_Update_Invaders : IF NOT finish THEN PROC_Bombs
2370 UNTIL finish=TRUE : Start%=Start%+1
2380 UNTIL P%<>7 : Base%=Base%-1
2385 IF Score%>Scores%(9) THEN PROC_Score
2390 ENDPROC
2400 DEF PROC_Update_Invaders
2410 IF Left% THEN X%=X%-1 ELSE X%=X%+1
2420 IF NOT Left% THEN PRINTTAB(X%-1,Y%+Q%*3);STRING$((R%-Q%+1)*3," "+D$+B$);
2430 PROC_Display_Invaders
2440 IF X%<=1 THEN Left%=FALSE : PROC_Move_Down
2450 IF X%+(P%-O%+1)*4>=39 THEN Left%=TRUE : PROC_Move_Down
2460 ENDPROC

2470 DEF FN_Find_Char
2480 A%=&87
2490 !Ch%=USR(&FFF4)
2500 = Ch%?1

2510 DEF FN_Is_Line
2520 L%=0 : FOR K%=0 TO 4 : IF NOT Space%(I%,K%) THEN L%=L%+1
2530 NEXT : IF L%=5 THEN =FALSE ELSE =TRUE

2540 DEF FN_Is_Row
2550 L%=0 : FOR I%=0 TO 6 : IF NOT Space%(I%,K%) THEN L%=L%+1
2560 NEXT : IF L%=7 THEN =FALSE ELSE =TRUE

2570 DEF PROC_Bombs
2580 LOCAL D% : IF Bomb%<MBomb% THEN PROC_New_Bomb
2590 IF Bomb%=0 GOTO 2660
2600 FOR D%=1 TO MBomb%
2610 IF Bombs%(D%,1)<>0 THEN PROC_Look_Bomb
2620 NEXT
2630 FOR D%=1 TO MBomb%
2640   IF Bombs%(D%,1)=23 THEN PRINTTAB(BBombs%(D%,0),Bombs%(D%,1));" "; : Bombs%(D%,1)=0 : Bombs%=Bombs%-1
2650 NEXT
2660 ENDPROC

2670 LOCAL D% : IF Bomb%<MBomb% THEN PROC_New_Bomb
2680 IF Bomb%=0 GOTO 910
2690 FOR D%=1 TO MBomb%
2700   IF Bombs%(D%,1)<>0 THEN PROC_Look_Bomb
2710 NEXT
2720 FOR D%=1 TO MBomb%
2730   IF Bombs%(D%,1)=23 THEN PRINTTAB(BBombs%(D%,0),Bombs%(D%,1));" "; : Bombs%(D%,1)=0 : Bombs%=Bombs%-1
2740 NEXT
2750 ENDPROC
2760 DEF PROC_Look_Bomb
2770 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1)+1);
2780 IF (FN_Find_Char<>32) AND ((Bombs%(D%,1)+1>Y%+(R%+1)*3) OR (Bombs%(D%,0)<X%) OR (Bombs%(D%,0)>=X%+(P%-O%+1)*4)) THEN PROC_Bomb_Hit ELSE PROC_Move_Bomb
2790 ENDPROC

2800 DEF PROC_Move_Bomb
2810 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1));" ";
2820 Bombs%(D%,1)=Bombs%(D%,1)+1
2830 IF Bombs%(D%,1)=23 THEN Bombs%(D%,1)=0 : Bomb%=Bomb%-1 : GOTO 2910
2840 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1));"#";
2850 ENDPROC
2860 DEF PROC_New_Bomb
2870 D%=-1 : REPEAT : D%=D%+1 : UNTIL Bombs%(D%,1)=0 OR D%=MBomb%
2880 REPEAT : T%=RND(P%-O%) + O% : UNTIL Space%(T%,5)
2890 J%=5 : REPEAT : J%=J%-1 : UNTIL Space%(T%,J%) = TRUE
2900 Bombs%(D%,0)=X%+(T%-O%)*4+1 : Bombs%(D%,1)=Y%+(J%)*3+2 : Bomb%=Bomb%+1
2910 ENDPROC

2920 DEF PROC_Look_Bomb
2930 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1)+1);
2940 IF (FN_Find_Char<>32) AND ((Bombs%(D%,1)+1>Y%+(R%+1)*3) OR (Bombs%(D%,0)<X%) OR (Bombs%(D%,0)>=X%+(P%-O%+1)*4)) THEN PROC_Bomb_Hit ELSE PROC_Move_Bomb
2950 ENDPROC

2960 DEF PROC_Bomb_Hit
2970 Bomb%=Bomb%-1
2980 IF Bombs%(D%,1)+1=23 THEN PROC_Bomb_Hit_Base : GOTO 3040
2990 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1)+1); : C%=FN_Find_Char
3000 IF C%=ASC(BL$) THEN PRINT"|"; : GOTO 3040
3010 IF C%=ASC("|") THEN PRINT"p"; : GOTO 3040
3020 IF C%=ASC("p") THEN PRINT" "; : GOTO 3040
3030 PRINT" ";
3040 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1));" "; : Bombs%(D%,1)=0
3050 ENDPROC

3060 DEF PROC_Bomb_Hit_Base
3070 SOUND &13,-10,6,10
3080 PRINTTAB(B%+1,23);"   ";
3090 B%=1
3100 Base%=Base%-1
3110 PRINTTAB(0,24);STRING$(20," ");
3120 IF Base%=0 THEN finish=TRUE ELSE PROC_Display_Base : PROC_Info_Line
3130 FOR I%=1 TO 10000 : NEXT
3140 ENDPROC

3150 DEF PROC_Score
3160 CLS : S%=10 : REPEAT : S%=S%-1 : UNTIL Score%<=Scores%(S%) OR S%=0
3170 IF S%=8 THEN GOTO 3190
3180 FOR I%=S%+1 TO 8 : Scores%(I%+1)=Scores%(I%) : Names$(I%+1)=Names$(I%) : NEXT
3190 Scores%(S%+1)=Score%
3200 PRINT'''G$" You are at number ";S%+2;" in the top 10"''''M$"Enter your name"C$;
3210 INPUT Name$ : IF LEN(Name$)>15 THEN Name$=LEFT$(Name$,15)
3220 Names$(S%+1)=Name$
3230 ENDPROC

3240 DEF PROC_Initialize
3250 *FX210 0
3260 FOR I%=0 TO 9
3270   Names$(I%)="Mark beat you!!!"
3280   Scores%(I%)=10000-(I%*1000)
3290 NEXT
3300 ENDPROC

3310 DEF PROC_Scores
3320 CLS
3330 PRINTCHR$(141)CHR$(130)"   Scores given :-"
3340 PRINTCHR$(141)CHR$(130)"   Scores given :-"
3350 FOR I%=4 TO 24 : PRINTTAB(0,I%);CHR$(150); : NEXT
3360 PRINTTAB(5,6);Mystery$;TAB(20,6);CHR$(133);"????";
3370 PRINTTAB(6,10);Alien2$(0);TAB(20,11);CHR$(133)"60"
3380 PRINTTAB(6,15);Alien1$(0);TAB(20,16);CHR$(133)"40"
3390 PRINTTAB(6,20);Alien0$(0);TAB(20,21);CHR$(133)"20"
3400 ENDPROC
 
3410 DEF PROC_High_Scores
3420 CLS
3430 PRINTCHR$(141)CHR$(130)"          High Scores"
3440 PRINTCHR$(141)CHR$(130)"          High Scores"
3450 FOR I%=0 TO 9
3460   PRINT'CHR$(134);I%+1;TAB(4);Names$(I%);TAB(30);Scores%(I%)
3470 NEXT
3480 ENDPROC

3490 DEF PROC_Time_key
3500 TIME=0
3510 REPEAT
3520   A$=INKEY$(0)
3530   IF A$="s" OR A$="S" THEN *FX 210 0
3540   IF A$="o" OR A$="O" THEN *FX 210 1
3550 UNTIL A$="Q" OR A$="q" OR A$=" " OR TIME=1000
3560 ENDPROC
