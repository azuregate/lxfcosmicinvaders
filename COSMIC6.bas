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
215 REM **** Shield ****
216 Shield$=BL$+BL$+BL$+D$+B$+B$+B$+BL$+BL$+BL$+D$+B$+B$+B$+BL$+BL$+BL$
220 REM **** Space Invader A ****
230 Base$=" p^p "
240 Alien1$(0)=GR$+" "+BL$+" "+D$+B$+B$+B$+GR$+BL$+BL$+BL$+D$+B$+B$+B$+GR$+BL$+" "+BL$
250 Alien1$(1)=GR$+BL$+" "+BL$+D$+B$+B$+B$+GR$+BL$+BL$+BL$+D$+B$+B$+B$+GR$+" "+BL$+" "
260 PRINTTAB(13)CHR$(141)CHR$(131);"COSMIC INVADERS"
270 PRINTTAB(13)CHR$(141)CHR$(134);"COSMIC INVADERS"
280 PRINT
290 PRINT
300 PRINTTAB(15)CHR$(130);GR$;Alien1$(0)
310 PRINTTAB(15)CHR$(132);GR$;Alien1$(1)
320 PRINT
330 PRINT
340 PRINT CHR$129;"Instructions for use :-"
350 PROCTitle_Music
360 PRINT
370 PRINT CHR$134;" The object of the game is to"
380 PRINT CHR$134;"shoot the cosmic aliens from the sky to";
390 PRINT CHR$134;"save the world."
400 PRINT
410 PRINT CHR$134;"Press the following keys for use :-"
420 PRINT
430 PRINT'" Z - To move left"
440 PRINT'" X - To move right"
450 PRINT'" SHIFT - To fire"
460 PRINT'" ESCAPE - To exit from game"
470 PRINT
480 PRINT CHR$130;"Press" CHR$133;"Space" CHR$130;"to start or 'Q' to quit."
490 REPEAT
500 A$ = INKEY$(100)
510 IF A$ = "Q" OR A$ = "q" THEN PROCGame_Over
520 UNTIL A$ = " "
530 Start% = 0
540 Score% = 0
550 Base% = 3
560 PROC_Setup_Game
570 END
580 DEF PROCGame_Over
590 CLS
600 PRINTTAB(13)CHR$(141)CHR$(129);"GAME OVER"
610 PRINTTAB(13)CHR$(141)CHR$(132);"GAME OVER"
620 PRINT
630 PRINTTAB(13)CHR$(134);"Thanks for playing!"
640 END
650 ENDPROC
660 DEF PROCTitle_Music
670 ENVELOPE 1,1,0,0,0,20,20,20,126,-1,-1,-1,126,0
680 SOUND 1,-15,53,20 : REM Note 1
690 SOUND 1,0,0,5 : REM Short pause
700 SOUND 1,-15,65,20 : REM Note 2
710 SOUND 1,0,0,5 : REM Short pause
720 SOUND 1,-15,61,20 : REM Note 3
730 SOUND 1,0,0,5 : REM Short pause
740 SOUND 1,-15,41,20 : REM Note 4
750 SOUND 1,0,0,5 : REM Short pause
760 SOUND 1,-15,49,40 : REM Note 5 (longer duration)
770 ENDPROC
780 DEF PROC_Setup_Game
790 O%=0 : P%=6 : Q%=0 : R%=4 : B%=1 : Bomb%=0 : MBomb%=Start%+6 : FOR I%=0 TO 10 : Bombs%(I%,1)=0 : NEXT
800 Mystery%=FALSE : Missile%=FALSE : MissileX%=0 : MissileY%=0 : finish=FALSE : VDU 23,1,0;0;0;0;
810 CLS
820 PROC_Info_Line : PROC_Display_Shields : PROC_Colour_setup : PROC_Display_Base
830 ENDPROC
840 DEF PROC_Info_Line
850 PRINTTAB(0,0)G$"HS"M$;Scores%(0);
860 PRINTTAB(20,0)G$"Score"M$;Score%;
870 PRINTTAB(0,24);CHR$(150);
880 FOR I%=1 TO Base%:PRINTBase$;:NEXT
890 ENDPROC
900 DEF PROC_Display_Shields
910 FOR I%=0 TO 3 : PRINTTAB(5+I%*9,20);Shield$ : NEXT
920 ENDPROC
930 DEF PROC_Colour_setup
940 PRINTTAB(0,1);GR$;
950 FOR I%=2 TO 7 : PRINTTAB(0,I%);GC$;TAB(0,I%+6);GR$;TAB(0,I%+12);GY$; : NEXT
960 FOR I%=0 TO 2:PRINTTAB(0,I%+20);GG$; : NEXT : PRINT'GR$;
970 ENDPROC
980 DEF PROC_Display_Base
990 PRINTTAB(B%,23);Base$
1000 ENDPROC
