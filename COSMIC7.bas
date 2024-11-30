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
420 PRINTTAB(13)CHR$(141)CHR$(131);"COSMIC INVADERS"
430 PRINTTAB(13)CHR$(141)CHR$(134);"COSMIC INVADERS"
440 PRINT
450 PRINT
460 PRINTTAB(15)CHR$(130);GR$;Alien1$(0)
470 PRINTTAB(15)CHR$(132);GR$;Alien1$(1)
480 PRINT
490 PRINT
500 PRINT CHR$129;"Instructions for use :-"
510 PROCTitle_Music
520 PRINT
530 PRINT CHR$134;" The object of the game is to"
540 PRINT CHR$134;"shoot the cosmic aliens from the sky to";
550 PRINT CHR$134;"save the world."
560 PRINT
570 PRINT CHR$134;"Press the following keys for use :-"
580 PRINT
590 PRINT'" Z - To move left"
600 PRINT'" X - To move right"
610 PRINT'" SHIFT - To fire"
620 PRINT'" ESCAPE - To exit from game"
630 PRINT
640 PRINT CHR$130;"Press" CHR$133;"Space" CHR$130;"to start or 'Q' to quit."
650 REPEAT
660 A$ = INKEY$(100)
670 IF A$ = "Q" OR A$ = "q" THEN PROCGame_Over
680 UNTIL A$ = " "
690 Start% = 0
700 Score% = 0
710 Base% = 3
720 PROC_Setup_Game
730 END
740 DEF PROCGame_Over
750 CLS
760 PRINTTAB(13)CHR$(141)CHR$(129);"GAME OVER"
770 PRINTTAB(13)CHR$(141)CHR$(132);"GAME OVER"
780 PRINT
790 PRINTTAB(13)CHR$(134);"Thanks for playing!"
800 END
810 ENDPROC
820 DEF PROCTitle_Music
830 ENVELOPE 1,1,0,0,0,20,20,20,126,-1,-1,-1,126,0
840 SOUND 1,-15,53,20 : REM Note 1
850 SOUND 1,0,0,5 : REM Short pause
860 SOUND 1,-15,65,20 : REM Note 2
870 SOUND 1,0,0,5 : REM Short pause
880 SOUND 1,-15,61,20 : REM Note 3
890 SOUND 1,0,0,5 : REM Short pause
900 SOUND 1,-15,41,20 : REM Note 4
910 SOUND 1,0,0,5 : REM Short pause
920 SOUND 1,-15,49,40 : REM Note 5 (longer duration)
930 ENDPROC
940 DEF PROC_Setup_Game
950 O%=0 : P%=6 : Q%=0 : R%=4 : B%=1 : Bomb%=0 : MBomb%=Start%+6 : FOR I%=0 TO 10 : Bombs%(I%,1)=0 : NEXT
960 Mystery%=FALSE : Missile%=FALSE : MissileX%=0 : MissileY%=0 : finish=FALSE : VDU 23,1,0;0;0;0;
970 CLS
980 PROC_Info_Line : PROC_Display_Shields : PROC_Colour_setup : PROC_Invader_setup : PROC_Display_Invaders : PROC_Display_Base
990 ENDPROC
1000 DEF PROC_Info_Line
1010 PRINTTAB(0,0)G$"HS"M$;Scores%(0);
1020 PRINTTAB(20,0)G$"Score"M$;Score%;
1030 PRINTTAB(0,24);CHR$(150);
1040 FOR I%=1 TO Base%:PRINTBase$;:NEXT
1050 ENDPROC
1060 DEF PROC_Display_Shields
1070 FOR I%=0 TO 3 : PRINTTAB(5+I%*9,20);Shield$ : NEXT
1080 ENDPROC
1090 DEF PROC_Colour_setup
1100 PRINTTAB(0,1);GR$;
1110 FOR I%=2 TO 7 : PRINTTAB(0,I%);GC$;TAB(0,I%+6);GR$;TAB(0,I%+12);GY$; : NEXT
1120 FOR I%=0 TO 2:PRINTTAB(0,I%+20);GG$; : NEXT : PRINT'GR$;
1130 ENDPROC
1140 DEF PROC_Display_Base
1150 PRINTTAB(B%,23);Base$
1160 ENDPROC
1170 DEF PROC_Invader_setup
1180 FOR I%=0 TO 7 : FOR J%=0 TO 5 : Space%(I%,J%)=TRUE : NEXT : NEXT
1190 X%=10 : Y%=Start%MOD4+2 : Left%=TRUE
1200 ENDPROC
1210 DEF PROC_Display_Invaders
1220 SOUND 1,-15,1,1 : I%=O% : M%=ABS(X% MOD 2) : REM M%=ABS((X%+I%*4)MOD 2)
1230 REPEAT : PROC_Key_Test : J%=(I%-O%)*4
1240 FOR K%=Q% TO R% : IF Space%(I%,K%) THEN PROC_Invader ELSE PROC_Blank(J%)
1250   NEXT
1260   IF Missile% THEN PROC_Move_Missile(I%)
1270   IF Mystery% THEN PROC_Move_Mystery ELSE IF RND(100)=1 THEN PROC_Start_Mystery
1280   I%=I%+1 : UNTIL I%>P% OR finish=TRUE
1290 ENDPROC
1300 DEF PROC_Key_Test
1310  IF INKEY(-98) AND NOT INKEY(-67) THEN PROC_Move_Left
1320 IF INKEY(-67) AND NOT INKEY(-98) THEN PROC_Move_Right
1330 IF INKEY(-1) AND NOT Missile% THEN PROC_Fire
1340 IF INKEY(-68) THEN REPEAT UNTIL INKEY(-54)
1350 *FX 15 1
1360 ENDPROC
1370 DEF PROC_Move_Left
1380 IF B%>1 THEN B%=B%-1
1390 PROC_Display_Base
1400 ENDPROC
1410 DEF PROC_Move_Right
1420 IF B%<34 THEN B%=B%+1
1430 PROC_Display_Base
1440 ENDPROC
1450 DEF PROC_Fire
1460 SOUND &0012,2,0,10 : Missile%=TRUE : MissileX%=B%+2 : MissileY%=22 : PROC_Move_Missile(L%)
1470 ENDPROC
1480 DEF PROC_Move_Missile(L%)
1490 LOCAL I%,K%
1500 PRINTTAB(MissileX%,MissileY%);
1510 IF FN_Find_Char <> 32 THEN PROC_Hit : GOTO 1650
1520 PRINTTAB(MissileX%,MissileY%+1);
1530 IF MissileY%+1 <> 23 THEN PRINT" "
1540 PRINTTAB(MissileX%,MissileY%);
1550 IF MissileY%<>1 THEN PRINT"^"
1560 IF MissileY%>1 THEN MissileY%=MissileY%-1 ELSE Missile%=FALSE
1570 ENDPROC
1580 DEF PROC_Move_Missile(L%)
1590 LOCAL I%,K%
1600 PRINTTAB(MissileX%,MissileY%);
1610 IF FN_Find_Char <> 32 THEN PROC_Hit : GOTO 1650
1620 PRINTTAB(MissileX%,MissileY%+1);
1630 IF MissileY%+1 <> 23 THEN PRINT" "
1640 PRINTTAB(MissileX%,MissileY%);
1650 IF MissileY%<>1 THEN PRINT"^"
1660 IF MissileY%>1 THEN MissileY%=MissileY%-1 ELSE Missile%=FALSE
1670 ENDPROC
1680 DEF PROC_Invader
1690 PRINTTAB(X%+J%,Y%+K%*3);
1700 ON K%+1 GOTO 1710,1710,1720,1720,1730,1740
1710 PRINT Alien2$(M%) : GOTO 1750
1720 PRINT Alien1$(M%) : GOTO 1750
1730 PRINT Alien0$(M%) : GOTO 1750
1740 finish=TRUE
1750 ENDPROC
1760 DEF PROC_Blank(J%)
1770 IF NOT Left% THEN J%=J%-1
1780 PRINTTAB(X%+J%,Y%+K%*3); : IF Left% THEN PRINTBlank1$ ELSE PRINTBlank2$
1790 ENDPROC

