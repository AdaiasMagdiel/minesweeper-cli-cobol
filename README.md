# Minesweeper CLI (COBOL)

A basic Minesweeper game for the command line, written in COBOL. This is a learning project built to get familiar with the language.

## Status

Early stage. Currently the board is initialized with fixed cell states and printed to the terminal; no interactive gameplay yet.

## Board legend

| Symbol | Meaning |
| ------ | ------- |
| `O`    | Cleared cell |
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

- [ ] Random bomb placement
- [ ] User input / interaction
- [ ] Win/loss detection
- [ ] Cell flagging
