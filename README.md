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

<!-- ### Compdb -->

<!-- It can also be usefull to have 'compile commands' for header files. They can be provided by [compdb](https://github.com/Sarcasm/compdb), using the ```compile_commands.json``` file and generating a new one. -->
<!-- ```shell -->
<!-- compdb -p build -c compdb.complementers=headerdb update -->
<!-- compdb -p build -c compdb.complementers=headerdb list > compile_commands.json -->
<!-- ``` -->

## Acknowledgements

This emacs configuration is inspired by the [centaur](https://github.com/seagle0128/.emacs.d) configuration.
