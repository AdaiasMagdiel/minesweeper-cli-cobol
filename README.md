# Minesweeper CLI (COBOL)

A basic Minesweeper game for the command line, written in COBOL. This is a learning project built to get familiar with the language.

## Status

Early stage. The game shows a banner and menu (play/exit) with input validation. Board initialization and rendering are implemented but not yet wired into the game loop; no interactive gameplay yet.

## Board legend

| Symbol | Meaning |
| ------ | ------- |
| `■`    | Hidden cell |
| ` `    | Empty cell |
| `X`    | Bomb |

## Requirements

- A COBOL compiler, such as [GnuCOBOL](https://gnucobol.sourceforge.io/).

## Build & run

```sh
cobc -x -o minesweeper MINESWPR.cbl
./minesweeper
```

## Roadmap

- [ ] Wire board init/display into the game loop
- [ ] Random bomb placement
- [ ] Cell reveal input / interaction
- [ ] Win/loss detection
- [ ] Cell flagging
