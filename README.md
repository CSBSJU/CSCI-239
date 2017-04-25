[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue.svg)](http://creativecommons.org/licenses/by-sa/4.0/) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**Non-software content:** All of the non-software content in this repository is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-sa/4.0/) unless otherwise marked.

**Software:** All of the software and any associated source code contained in this repository is licensed under the [MIT license](https://opensource.org/licenses/MIT) unless otherwise marked.

# CSCI 239
Course materials for CSCI 239

## To clone
```
git clone --recursive https://github.com/CSBSJU/CSCI-239
```

## To update
```
git pull
```

```
git submodule foreach git pull
```

To make this easier for yourself in the future, you can execute the command

```
git config alias.up '!git pull && git submodule foreach git pull'
```

which will create a new git _alias_ (read: command) called `up`. That way, to
run the previous two commands, you can now use the single command

```
git up
```
