10 REM TITLE SCREEN
20 MODE 7
30 VDU 23,1,0;0;0;0;
40 DIM Alien0$(1), Alien1$(1)
50 REM **** Special Characters ****
60 BL$=CHR$(255) : REM Block
70 D$=CHR$(10) : REM Cursor Down
80 B$=CHR$(8) : REM Cursor Back
90 GR$=CHR$(145) : REM Red graphics
100 REM **** Space Invader A ****
110 Alien1$(0)=GR$+" "+BL$+" "+D$+B$+B$+B$+GR$+BL$+BL$+BL$+D$+B$+B$+B$+GR$+BL$+" "+BL$
120 Alien1$(1)=GR$+BL$+" "+BL$+D$+B$+B$+B$+GR$+BL$+BL$+BL$+D$+B$+B$+B$+GR$+" "+BL$+" "
130 PRINTTAB(13)CHR$(141)CHR$(131);"COSMIC INVADERS"
140 PRINTTAB(13)CHR$(141)CHR$(134);"COSMIC INVADERS"
150 PRINT
160 PRINT
170 PRINTTAB(15)CHR$(130);GR$;Alien1$(0)
180 PRINTTAB(15)CHR$(132);GR$;Alien1$(1)
190 PRINT
200 PRINT
210 PRINT CHR$129;"Instructions for use :-"
220 PROCTitle_Music
230 PRINT
240 PRINT CHR$134;"     The object of the game is to"
250 PRINT CHR$134;"shoot the cosmic aliens from the sky to";
260 PRINT CHR$134;"save the world."
270 PRINT
280 PRINT CHR$134;"Press the following keys for use :-"
290 PRINT
300 PRINT'"     Z - To move left"
310 PRINT'"     X - To move right"
320 PRINT'"     SHIFT  - To fire"
330 PRINT'"     ESCAPE - To exit from game"
340 PRINT
350 PRINT CHR$130;"Press" CHR$133;"Space" CHR$130;"to start or 'Q' to quit."
360 REPEAT
370 A$ = INKEY$(100)
380 IF A$ = "Q" OR A$ = "q" THEN PROCGame_Over
390 UNTIL A$ = " "
400 PRINT "Game starting..."
410 END
420 DEF PROCGame_Over
430 CLS
440 PRINTTAB(13)CHR$(141)CHR$(129);"GAME OVER"
450 PRINTTAB(13)CHR$(141)CHR$(132);"GAME OVER"
460 PRINT
470 PRINTTAB(13)CHR$(134);"Thanks for playing!"
480 END
490 ENDPROC
500 DEF PROCTitle_Music
510 ENVELOPE 1,1,0,0,0,20,20,20,126,-1,-1,-1,126,0
520 SOUND 1,-15,53,20  : REM Note 1
530 SOUND 1,0,0,5      : REM Short pause
540 SOUND 1,-15,65,20  : REM Note 2
550 SOUND 1,0,0,5      : REM Short pause
560 SOUND 1,-15,61,20  : REM Note 3
570 SOUND 1,0,0,5      : REM Short pause
580 SOUND 1,-15,41,20  : REM Note 4
590 SOUND 1,0,0,5      : REM Short pause
600 SOUND 1,-15,49,40  : REM Note 5 (longer duration)
610 ENDPROC
