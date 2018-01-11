# Linux Command
## remove all file with a certain pattern recursively
``` sh
$ find . -name "*.out" -type f
```
`-type f` means searching for only regular files.
and delete
``` sh
$ find . -name "*.out" -type f -delete
```
## git ignore file in sub folder / directory
``` 
**/filename
```
`**/`will match any folers.