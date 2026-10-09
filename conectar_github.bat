@echo off
chcp 65001 >nul
title Lima Softwares - conectar la web con GitHub (una sola vez)
cd /d "%~dp0"
echo.
echo  Conecta esta carpeta (la web de Lima Softwares) con
echo     https://github.com/shamerlicond-ops/lima-gestor
echo  Solo la WEB y el INSTALADOR van ahi. Nunca el codigo de LimaGestor.
echo.
where git >nul 2>nul || (
  echo  Falta Git. Instalalo con:   winget install Git.Git
  echo  o desde https://git-scm.com/download/win  y vuelve a ejecutar este archivo.
  pause & exit /b 1
)
if not exist ".git" git init -b main
git config user.name >nul 2>nul || git config user.name "Lima Softwares"
git config user.email >nul 2>nul || git config user.email "shamer.licond@gmail.com"
git remote remove origin >nul 2>nul
git remote add origin https://github.com/shamerlicond-ops/lima-gestor.git
git add -A
git commit -m "Web de Lima Softwares" >nul 2>nul
echo  Subiendo... (la primera vez se abre el navegador para iniciar sesion en GitHub)
git push -u origin main || (echo. & echo  No se pudo subir. Revisa tu sesion de GitHub y vuelve a intentar. & pause & exit /b 1)
echo.
echo  LISTO. Desde ahora construir_instalador.bat sube la web y el instalador solos.
pause
