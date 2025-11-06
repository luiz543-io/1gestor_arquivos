@echo off
REM  SISTEMA DE GESTÃO DE ARQUIVOS

REM === Varíaveis ===
set "BASE=C:\GestorArquivos"
set "DOCS=%BASE%\Documentos"
set "LOGS=%BASE%\Logs"
set "BACKUPS=%BASE%\Backups"
set "LOGFILE=%LOGS%\atividade.log"

REM === Criar pastas ===
echo Criando pastas...
for %%D in ("%BASE%" "%DOCS%" "%LOGS%" "%BACKUPS%") do (
    if not exist "%%~D" (
        mkdir "%%~D"
        echo %date% %time% - Criada pasta %%~D - Sucesso >> "%LOGFILE%"
    ) else (
        echo %date% %time% - Pasta %%~D já existia >> "%LOGFILE%"
    )
)

REM === Criar arquivos de documentos ===
echo Criando arquivos...
echo Relatorio do sistema > "%DOCS%\relatorio.txt"
echo nome,idade,cidade > "%DOCS%\dados.csv"
echo [configuracao] > "%DOCS%\config.ini"
echo %date% %time% - Criados arquivos de texto - Sucesso >> "%LOGFILE%"

REM === Backup ===
echo Fazendo backup...
xcopy "%DOCS%\*.*" "%BACKUPS%\" /Y >nul
echo Backup feito em: %date% %time% > "%BACKUPS%\backup_completo.bak"
echo %date% %time% - Backup realizado - Sucesso >> "%LOGFILE%"

REM === Relátorio Final ===
set /a TOTAL_PASTAS=4
set /a TOTAL_ARQUIVOS=3
echo RELATÓRIO DE EXECUÇÃO > "%BASE%\resumo_execucao.txt"
echo ---------------------- >> "%BASE%\resumo_execucao.txt"
echo Total de arquivos criados: %TOTAL_ARQUIVOS% >> "%BASE%\resumo_execucao.txt"
echo Total de pastas criadas: %TOTAL_PASTAS% >> "%BASE%\resumo_execucao.txt"
echo Data/Hora do backup: %date% %time% >> "%BASE%\resumo_execucao.txt"
echo %date% %time% - Relatório final criado - Sucesso >> "%LOGFILE%"

echo.
echo Tudo pronto As pastas e arquivos foram criados em %BASE%
pause