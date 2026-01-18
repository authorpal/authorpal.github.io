@echo off
title AuthorPal Website Deployer
color 0A

echo ==========================================
echo      AUTHORPAL WEBSITE DEPLOYER 🚀
echo ==========================================
echo.
echo This script will update your website automatically.
echo.

:: Ensure we are in the script's directory
cd /d "%~dp0"

echo [1/3] Checking for changes...
git status
echo.

set /p confirm="Do you want to publish these changes? (Y/N): "
if /i "%confirm%" neq "Y" goto :EOF

echo.
set /p msg="Enter a short description (e.g. Fix typo): "
if "%msg%"=="" set msg=Update website content

echo.
echo [2/3] Saving changes...
git add .
git commit -m "%msg%"

echo.
echo [3/3] Uploading to GitHub...
git push origin main

:: Error handling: If push failed, try to pull and push again
if %errorlevel% neq 0 (
    echo.
    echo ⚠️  UPLOAD FAILED! Trying to fix (Rebase)...
    git pull --rebase origin main
    git push origin main
)

echo.
echo ==========================================
echo      SUCCESS! Website Updated. ✅
echo ==========================================
pause
