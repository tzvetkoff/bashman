# Bashman - Pacman & Ghosts drawn in Bash!

![bashman.png](http://i.imgur.com/TabbRBO.png)

## Structure

`/plain/`: plain-text pacman and ghosts.

`/term/`: terminal versions with escape sequences, substituting `@` for color.

`/build/`: amalgamated script.

`/build.sh`: the build script.

## Usage

``` bash
source ./build/bashman.sh

# Initialize the 6 lines
bashman_init

# Append Pacman
bashman_append pacman-right

# Append original ghosts
bashman_append blinky
bashman_append pinky
bashman_append inky
bashman_append clyde

# Append a custom ghost
#           <ghost type> <color code>
bashman_append ghost-left   90

# Print
bashman_print

# Cleanup
bashman_unset
```

## Original ghosts

| Color         | Name                  |
| ------------- | --------------------- |
| Red           | Blinky                |
| Pink          | Pinky                 |
| Cyan          | Inky                  |
| Orange        | Clyde                 |

## Extra ghosts

| Color         | Name                  |
| ------------- | --------------------- |
| Yellow        | Kinky                 |
| Green         | Funky                 |
| Light Gray    | Spunky                |
| Dark Gray     | Spooky                |

## Block characters

| Character     | Description           |
| ------------- | --------------------- |
| █             | Full block            |
| ▄             | Lower half            |
| ▀             | Upper half            |
