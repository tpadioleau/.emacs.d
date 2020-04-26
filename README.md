# Emacs.d

## Installation

To install the configuration, go into your home and clone the repository:
```shell
cd ~ && git clone https://github.com/tpadioleau/.emacs.d.git
```
Don't forget to remove any old .emacs.d configuration before cloning.

Then call `all-the-icons-install-fonts` to install needed fonts.

## Usage

### Ccls

[Ccls](https://github.com/MaskRay/ccls) uses a [compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html). To generate it go into the build directory and do:
```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON /path/to/sources
```
It will generate a ```compile_commands.json``` file, containing necessary commands to compile source files.

## Acknowledgements

This emacs configuration is inspired by the
[centaur](https://github.com/seagle0128/.emacs.d) and
[doom-emacs](https://github.com/hlissner/doom-emacs) configurations.
