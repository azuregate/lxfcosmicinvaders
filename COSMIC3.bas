10 REM TITLE SCREEN
20 MODE 7
30 PRINTTAB(13)CHR$(141)CHR$(131);"COSMIC INVADERS"
40 PRINTTAB(13)CHR$(141)CHR$(134);"COSMIC INVADERS"
50 PRINT
60 PRINT CHR$129;"Instructions for use :-"
65 PROCTitle_Music
70 PRINT
80 PRINT CHR$134;"     The object of the game is to"
90 PRINT CHR$134;"shoot the cosmic aliens from the sky to";
100 PRINT CHR$134;"save the world."
110 PRINT
120 PRINT CHR$134;"Press the following keys for use :-"
130 PRINT
140 PRINT'"     Z - To move left"
150 PRINT'"     X - To move right"
160 PRINT'"     SHIFT  - To fire"
170 PRINT'"     ESCAPE - To exit from game"
180 PRINT
190 PRINT CHR$130;"Press" CHR$133;"Space" CHR$130;"to start or 'Q' to quit."
200 REPEAT
210 A$ = INKEY$(100)
220 IF A$ = "Q" OR A$ = "q" THEN PROCGame_Over
230 UNTIL A$ = " "
240 PRINT "Game starting..."
250 END
260 DEF PROCGame_Over
270 CLS
280 PRINTTAB(13)CHR$(141)CHR$(129);"GAME OVER"
290 PRINTTAB(13)CHR$(141)CHR$(132);"GAME OVER"
300 PRINT
310 PRINTTAB(13)CHR$(134);"Thanks for playing!"
320 END
330 ENDPROC
340 DEF PROCTitle_Music
350 ENVELOPE 1,1,0,0,0,20,20,20,126,-1,-1,-1,126,0
360 SOUND 1,-15,53,20  : REM Note 1
370 SOUND 1,0,0,5      : REM Short pause
380 SOUND 1,-15,65,20  : REM Note 2
390 SOUND 1,0,0,5      : REM Short pause
400 SOUND 1,-15,61,20  : REM Note 3
410 SOUND 1,0,0,5      : REM Short pause
420 SOUND 1,-15,41,20  : REM Note 4
430 SOUND 1,0,0,5      : REM Short pause
440 SOUND 1,-15,49,40  : REM Note 5 (longer duration)
450 ENDPROC

