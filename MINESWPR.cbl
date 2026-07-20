       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINESWPR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ROWS OCCURS 10 TIMES INDEXED BY I.
           05 WS-COLS OCCURS 10 TIMES INDEXED BY J.
               10 WS-CELL PIC X.
                   88 CELL-CLEAR VALUE 'C'.
                   88 CELL-EMPTY VALUE 'E'.
                   88 CELL-BOMB  VALUE 'B'.

       PROCEDURE DIVISION.

       PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
           AFTER J FROM 1 BY 1 UNTIL J > 10

           SET CELL-CLEAR (I, J) TO TRUE
       END-PERFORM.

       SET CELL-BOMB  (4, 5) TO TRUE.
       SET CELL-EMPTY (6, 2) TO TRUE.

       PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
           PERFORM VARYING J FROM 1 BY 1 UNTIL J>10
               EVALUATE TRUE
                   WHEN CELL-CLEAR (I, J)
                       DISPLAY "O" WITH NO ADVANCING
                   WHEN CELL-EMPTY (I, J)
                       DISPLAY " " WITH NO ADVANCING
                   WHEN CELL-BOMB (I, J)
                       DISPLAY "X" WITH NO ADVANCING
               END-EVALUATE
           END-PERFORM

           DISPLAY " "
       END-PERFORM.

       STOP RUN.
