10 REM TITLE SCREEN
20 MODE 7
30 PRINTTAB(13)CHR$(141)CHR$(131);"COSMIC INVADERS"
40 PRINTTAB(13)CHR$(141)CHR$(134);"COSMIC INVADERS"
50 PRINT
60 PRINT CHR$129;"Instructions for use :-"
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

