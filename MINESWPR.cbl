       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINESWPR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-USER-CHOICE PIC X.
       01 WS-BOARD OCCURS 10 TIMES INDEXED BY WS-ROW-IDX.
           05 WS-BOARD-ROW OCCURS 10 TIMES INDEXED BY WS-COL-IDX.
               10 WS-CELL-STATE PIC X.
                   88 CELL-HIDDEN VALUE 'H'.
                   88 CELL-EMPTY  VALUE 'E'.
                   88 CELL-BOMB   VALUE 'B'.
       01 WS-DISPLAY-INDEXES.
           05 WS-ROW-DISPLAY PIC Z9.

       PROCEDURE DIVISION.
       PERFORM DISPLAY-BANNER.
       PERFORM DISPLAY-MENU.

       DISPLAY "THE GAME!".

       STOP RUN.

       DISPLAY-BANNER.
           DISPLAY "                ___ __  __  __  _".
           DISPLAY "               / _//__\|  \/__\| |".
           DISPLAY "              | \_| \/ | -< \/ | |_".
           DISPLAY "               \__/\__/|__/\__/|___|".
           DISPLAY
               " __ __ _ __  _ ___  __  _   _  ___ ___ ___ ___ ___ ".
           DISPLAY
               "|  V  | |  \| | __/' _/| | | || __| __| _,\ __| _ \".
           DISPLAY
               "| \_/ | | | ' | _|`._`.| 'V' || _|| _|| v_/ _|| v /".
           DISPLAY
               "|_| |_|_|_|\__|___|___/!_/ \_!|___|___|_| |___|_|_\".

           DISPLAY " ".
           DISPLAY " ".
           
       DISPLAY-MENU.
           DISPLAY "1. PLAY".
           DISPLAY "2. EXIT".
           DISPLAY " ".

           DISPLAY "ENTER A OPTION: " WITH NO ADVANCING.
           
           PERFORM UNTIL 1 = 0
               ACCEPT WS-USER-CHOICE

               EVALUATE WS-USER-CHOICE
                   WHEN "1"
                       EXIT PERFORM
                   WHEN "2"
                       STOP RUN
                   WHEN OTHER
                       DISPLAY
                           "PLEASE, CHOICE A VALID OPTION (1 OR 2): "
                           WITH NO ADVANCING
               END-EVALUATE
           END-PERFORM.

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
