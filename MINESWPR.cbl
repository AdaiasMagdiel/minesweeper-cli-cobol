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
       01 WS-DISPLAY-INDEXES.
           05 WS-ROW-DISPLAY PIC Z9.

       PROCEDURE DIVISION.

       PERFORM START-BOARD.

       SET CELL-BOMB  (4, 5) TO TRUE.
       SET CELL-EMPTY (6, 2) TO TRUE.

       PERFORM DISPLAY-BOARD.

       STOP RUN.

       START-BOARD.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               AFTER J FROM 1 BY 1 UNTIL J > 10
    
               SET CELL-CLEAR (I, J) TO TRUE
           END-PERFORM.
           EXIT.
          
       DISPLAY-BOARD.
           DISPLAY "     ----------".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               MOVE I TO WS-ROW-DISPLAY
               DISPLAY WS-ROW-DISPLAY " | " WITH NO ADVANCING

               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 10
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
           EXIT.
