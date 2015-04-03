@echo off
set file=%~n1
set pdffile=%~1
set line=%~2
IF   [%1]==[]   GOTO   usage
IF   [%2]==[]   GOTO   usage
:begin
synctex.exe view -i %line%:0:%file%.tex -o "%pdffile%" -x "pdfopen --file %%{output} --page %%{page+1}"
pdfopen  --file="%pdffile%"
"%pdffile%"
exit /B 0

:usage
echo Usage: %0 pdffilename line_no ==) Forward search pdf file with adobe reader
echo eg: %0 "\xxx\xx\foo.pdf" 123
exit /B 0
