       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINESWPR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-USER-CHOICE PIC X.
       01 WS-BOARD OCCURS 10 TIMES INDEXED BY WS-ROW-IDX.
           05 WS-BOARD-ROW OCCURS 10 TIMES INDEXED BY WS-COL-IDX.
               10 WS-CELL-STATE PIC X.
                   88 WS-CELL-HIDDEN VALUE 'H'.
                   88 WS-CELL-EMPTY  VALUE 'E'.
                   88 WS-CELL-BOMB   VALUE 'B'.
       01 WS-DISPLAY-INDEXES.
           05 WS-ROW-DISPLAY PIC Z9.
       01 WS-CLS.
           05 WS-ESC-CHAR PIC X VALUE X"1B".
           05 WS-FILLER   PIC X(3) VALUE "[2J".
           05 WS-ESC-CH2  PIC X VALUE X"1B".
           05 WS-FILLER   PIC X(2) VALUE "[H".
       01 WS-GAME-STATUS PIC X VALUE 'R'.
           88 WS-GAME-OVER     VALUE 'O'.
       01 WS-ROW-INPUT     PIC 99.
       01 WS-COL-INPUT     PIC 99.
       01 WS-COL-INPUT-RAW PIC X.
       01 WS-BOMBS-TABLE.
           05 WS-BOMBS OCCURS 5 TIMES.
               10 WS-BOMB-ROW  PIC 99. 
               10 WS-BOMB-COL  PIC 99.
       01 WS-I         PIC 99.
       01 WS-PERFORM-J         PIC 99.

       PROCEDURE DIVISION.
       PERFORM DISPLAY-BANNER.
       PERFORM DISPLAY-MENU.

       PERFORM GAME.

       STOP RUN.

       GAME.
           MOVE 'R' TO WS-GAME-STATUS.

           PERFORM CLEAR-BOARD.
           PERFORM GENERATE-BOMBS.

           PERFORM UNTIL WS-GAME-OVER
               DISPLAY WS-CLS
               PERFORM DISPLAY-BOARD
               DISPLAY " "
               PERFORM ASK-BOARD-CHOICE

           END-PERFORM.

       ASK-BOARD-CHOICE.
           DISPLAY
               "CHOOSE A COLUMN (A-J), OR "
               "TYPE X TO EXIT: "
               WITH NO ADVANCING.
           PERFORM UNTIL 1 = 0
               ACCEPT WS-COL-INPUT-RAW
               EVALUATE WS-COL-INPUT-RAW
                   WHEN 'X'
                   WHEN 'x'
                       STOP RUN

                   WHEN 'A'
                   WHEN 'a'
                       MOVE 1 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'B'
                   WHEN 'b'
                       MOVE 2 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'C'
                   WHEN 'c'
                       MOVE 3 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'D'
                   WHEN 'd'
                       MOVE 4 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'E'
                   WHEN 'e'
                       MOVE 5 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'F'
                   WHEN 'f'
                       MOVE 6 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'G'
                   WHEN 'g'
                       MOVE 7 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'H'
                   WHEN 'h'
                       MOVE 8 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'I'
                   WHEN 'i'
                       MOVE 9 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN 'J'
                   WHEN 'j'
                       MOVE 10 TO WS-COL-INPUT
                       EXIT PERFORM
                   WHEN OTHER
                       DISPLAY
                           "PLEASE, CHOOSE A VALID COLUMN (A-J), OR "
                           "TYPE X TO EXIT: "
                           WITH NO ADVANCING
               END-EVALUATE
           END-PERFORM.

           DISPLAY
               "CHOOSE A ROW (1 TO 10), OR "
               "TYPE 0 TO EXIT: "
               WITH NO ADVANCING.
           PERFORM UNTIL 1 = 0
               ACCEPT WS-ROW-INPUT
               EVALUATE WS-ROW-INPUT
                   WHEN 0
                       STOP RUN

                   WHEN 1 THRU 10
                       EXIT PERFORM
                   WHEN OTHER
                       DISPLAY
                           "PLEASE, CHOOSE A VALID ROW (1 TO 10), OR "
                           "TYPE 0 TO EXIT: "
                           WITH NO ADVANCING
               END-EVALUATE
           END-PERFORM.

       DISPLAY-BANNER.
           DISPLAY "                ___ __  __  __  _   ".
           DISPLAY "               / _//__\|  \/__\| |  ".
           DISPLAY "              | \_| \/ | -< \/ | |_ ".
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

           DISPLAY "ENTER AN OPTION: " WITH NO ADVANCING.
           
           PERFORM UNTIL 1 = 0
               ACCEPT WS-USER-CHOICE

               EVALUATE WS-USER-CHOICE
                   WHEN "1"
                       EXIT PERFORM
                   WHEN "2"
                       DISPLAY "BYE! HOPE TO SEE YOU SOON."
                       STOP RUN
                   WHEN OTHER
                       DISPLAY
                           "PLEASE, CHOOSE A VALID OPTION (1 OR 2): "
                           WITH NO ADVANCING
               END-EVALUATE
           END-PERFORM.

       GENERATE-BOMBS.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               COMPUTE WS-BOMB-ROW (WS-I) = 
                   (FUNCTION RANDOM * 10) + 1

               COMPUTE WS-BOMB-COL (WS-I) = 
                   (FUNCTION RANDOM * 10) + 1
           END-PERFORM.

       CLEAR-BOARD.
           PERFORM VARYING WS-ROW-IDX FROM 1 BY 1 UNTIL WS-ROW-IDX > 10
               AFTER WS-COL-IDX FROM 1 BY 1 UNTIL WS-COL-IDX > 10

               SET WS-CELL-HIDDEN (WS-ROW-IDX, WS-COL-IDX) TO TRUE
           END-PERFORM.

       DISPLAY-BOARD.
           DISPLAY "     ABCDEFGHIJ".
           DISPLAY "     ----------".
           PERFORM VARYING WS-ROW-IDX FROM 1 BY 1 UNTIL WS-ROW-IDX > 10
               MOVE WS-ROW-IDX TO WS-ROW-DISPLAY
               DISPLAY WS-ROW-DISPLAY " | " WITH NO ADVANCING

               PERFORM VARYING WS-COL-IDX FROM 1 BY 1
                       UNTIL WS-COL-IDX > 10
                   EVALUATE TRUE
                       WHEN WS-CELL-HIDDEN (WS-ROW-IDX, WS-COL-IDX)
                           DISPLAY "■" WITH NO ADVANCING
                       WHEN WS-CELL-EMPTY (WS-ROW-IDX, WS-COL-IDX)
                           DISPLAY " " WITH NO ADVANCING
                       WHEN WS-CELL-BOMB (WS-ROW-IDX, WS-COL-IDX)
                           DISPLAY "X" WITH NO ADVANCING
                   END-EVALUATE
               END-PERFORM

               DISPLAY " "
           END-PERFORM.
