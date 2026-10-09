@echo off
chcp 65001 >nul
title Lima Softwares - subir la web
cd /d "%~dp0"
git add -A
git commit -m "Actualizar web" >nul 2>nul
git push && (echo. & echo  Subido. En 1-2 minutos se ve en limasoftwares.pages.dev) || echo  No se pudo subir: revisa internet o tu sesion de GitHub.
pause
