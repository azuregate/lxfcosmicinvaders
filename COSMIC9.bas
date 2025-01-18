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
700 UNTIL A$ = " "
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
1110 DEF PROC_Colour_setup
1120 PRINTTAB(0,1);GR$;
1130 FOR I%=2 TO 7 : PRINTTAB(0,I%);GC$;TAB(0,I%+6);GR$;TAB(0,I%+12);GY$; : NEXT
1140 FOR I%=0 TO 2:PRINTTAB(0,I%+20);GG$; : NEXT : PRINT'GR$;
1150 ENDPROC
1160 DEF PROC_Display_Base
1170 PRINTTAB(B%,23);Base$
1180 ENDPROC
1190 DEF PROC_Invader_Setup
1200 FOR I%=0 TO 7 : FOR J%=0 TO 5 : Space%(I%,J%)=TRUE : NEXT : NEXT
1210 X%=10 : Y%=Start%MOD4+2 : Left%=TRUE
1220 ENDPROC

1221 DEF PROC_Fire
1222 SOUND &0012,2,0,10 : Missile%=TRUE : MissileX%=B%+2 : MissileY%=22 : PROC_Move_Missile(L%)
1223 ENDPROC
1224 DEF PROC_Move_Missile(L%)
1225 LOCAL I%,K%
1226 PRINTTAB(MissileX%,MissileY%);
1227 IF FN_Find_Char <> 32 THEN PROC_Hit : GOTO 1650
1228 PRINTTAB(MissileX%,MissileY%+1);
1229 IF MissileY%+1 <> 23 THEN PRINT" "
1230 PRINTTAB(MissileX%,MissileY%);
1231 IF MissileY%<>1 THEN PRINT"^"
1232 IF MissileY%>1 THEN MissileY%=MissileY%-1 ELSE Missile%=FALSE
1233 ENDPROC

1234 DEF PROC_Display_Invaders
1240 SOUND 1,-15,1,1 : I%=O% : M%=ABS(X% MOD 2) : REM M%=ABS((X%+I%*4)MOD 2)
1250 REPEAT : PROC_Key_Test : J%=(I%-O%)*4
1260 FOR K%=Q% TO R% : IF Space%(I%,K%) THEN PROC_Invader ELSE PROC_Blank(J%)
1270   NEXT
1280   IF Missile% THEN PROC_Move_Missile(I%)
1290   IF Mystery% THEN PROC_Move_Mystery ELSE IF RND(100)=1 THEN PROC_Start_Mystery
1300   I%=I%+1 : UNTIL I%>P% OR finish=TRUE
1310 ENDPROC
1320 DEF PROC_Key_Test
1330  IF INKEY(-98) AND NOT INKEY(-67) THEN PROC_Move_Left
1340 IF INKEY(-67) AND NOT INKEY(-98) THEN PROC_Move_Right
1350 IF INKEY(-1) AND NOT Missile% THEN PROC_Fire
1360 IF INKEY(-68) THEN REPEAT UNTIL INKEY(-54)
1370 *FX 15 1
1380 ENDPROC
1390 DEF PROC_Move_Left
1400 IF B%>1 THEN B%=B%-1
1410 PROC_Display_Base
1420 ENDPROC
1430 DEF PROC_Move_Right
1440 IF B%<34 THEN B%=B%+1
1450 PROC_Display_Base
1460 ENDPROC
1470 DEF PROC_Move_Down
1480 PRINTTAB(X%,Y%+Q%*3);STRING$((P%-O%+1)*4," "); : Y%=Y%+1 : IF Y%-(4-R%)*3=9 THEN finish=TRUE
1490 ENDPROC
1500 DEF PROC_Invader
1510 PRINTTAB(X%+J%,Y%+K%*3);
1520 ON K%+1 GOTO 1530,1530,1540,1540,1550,1560
1530 PRINT Alien2$(M%) : GOTO 1570
1540 PRINT Alien1$(M%) : GOTO 1570
1550 PRINT Alien0$(M%) : GOTO 1570
1560 finish=TRUE
1570 ENDPROC
1580 DEF PROC_Blank(J%)
1590 IF NOT Left% THEN J%=J%-1
1600 PRINTTAB(X%+J%,Y%+K%*3); : IF Left% THEN PRINTBlank1$ ELSE PRINTBlank2$
1610 ENDPROC
1620 DEF PROC_Start_Mystery
1630 MystX%=1 : Mystery%=TRUE
1640 PRINTTAB(MystX%,1);Mystery$;
1650 ENDPROC
1660 DEF PROC_Move_Mystery
1670 SOUND &13,3,20,5
1680 MystX%=MystX%+1
1690 PRINTTAB(MystX%,1);Mystery$;
1700 IF MystX%=35 THEN Mystery%=FALSE : PRINTTAB(MystX%,1);"    ";
1710 ENDPROC
1720 DEF PROC_Play
1730 REPEAT : PROC_Setup_Game
1740 REPEAT : PROC_Key_Test : PROC_Update_Invaders : REM IF NOT finish THEN PROC_Bombs (We won't drop bombs for now).
1750 UNTIL finish=TRUE : Start%=Start%+1
1760 UNTIL P%<>7 : Base%=Base%-1
1770 ENDPROC
1780 DEF PROC_Update_Invaders
1790 IF Left% THEN X%=X%-1 ELSE X%=X%+1
1800 IF NOT Left% THEN PRINTTAB(X%-1,Y%+Q%*3);STRING$((R%-Q%+1)*3," "+D$+B$);
1810 PROC_Display_Invaders
1820 IF X%<=1 THEN Left%=FALSE : PROC_Move_Down
1830 IF X%+(P%-O%+1)*4>=39 THEN Left%=TRUE : PROC_Move_Down
1840 ENDPROC

1850 DEF FN_Find_Char
1860 A%=&87
1870 !Ch%=USR(&FFF4)
1880 = Ch%?1
