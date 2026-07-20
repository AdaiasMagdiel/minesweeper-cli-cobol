       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINESWPR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BOARD OCCURS 10 TIMES INDEXED BY WS-ROW-IDX.
           05 WS-BOARD-ROW OCCURS 10 TIMES INDEXED BY WS-COL-IDX.
               10 WS-CELL-STATE PIC X.
                   88 CELL-HIDDEN VALUE 'H'.
                   88 CELL-EMPTY  VALUE 'E'.
                   88 CELL-BOMB   VALUE 'B'.
       01 WS-DISPLAY-INDEXES.
           05 WS-ROW-DISPLAY PIC Z9.

       PROCEDURE DIVISION.

       PERFORM CLEAR-BOARD.

       SET CELL-BOMB  (4, 5) TO TRUE.
       SET CELL-EMPTY (6, 2) TO TRUE.

       PERFORM DISPLAY-BOARD.

       STOP RUN.

       CLEAR-BOARD.
           PERFORM VARYING WS-ROW-IDX FROM 1 BY 1 UNTIL WS-ROW-IDX > 10
               AFTER WS-COL-IDX FROM 1 BY 1 UNTIL WS-COL-IDX > 10

               SET CELL-HIDDEN (WS-ROW-IDX, WS-COL-IDX) TO TRUE
           END-PERFORM.

       DISPLAY-BOARD.
           DISPLAY "     ----------".
           PERFORM VARYING WS-ROW-IDX FROM 1 BY 1 UNTIL WS-ROW-IDX > 10
               MOVE WS-ROW-IDX TO WS-ROW-DISPLAY
               DISPLAY WS-ROW-DISPLAY " | " WITH NO ADVANCING

               PERFORM VARYING WS-COL-IDX FROM 1 BY 1
                       UNTIL WS-COL-IDX > 10
                   EVALUATE TRUE
                       WHEN CELL-HIDDEN (WS-ROW-IDX, WS-COL-IDX)
                           DISPLAY "■" WITH NO ADVANCING
                       WHEN CELL-EMPTY (WS-ROW-IDX, WS-COL-IDX)
                           DISPLAY " " WITH NO ADVANCING
                       WHEN CELL-BOMB (WS-ROW-IDX, WS-COL-IDX)
                           DISPLAY "X" WITH NO ADVANCING
                   END-EVALUATE
               END-PERFORM

               DISPLAY " "
           END-PERFORM.
