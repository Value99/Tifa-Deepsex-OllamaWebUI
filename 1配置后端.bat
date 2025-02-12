@echo off
echo 正在处理，请稍等...
:: 设置OLLAMA_HOST环境变量并验证
setx OLLAMA_HOST ":11434"
if %ERRORLEVEL% neq 0 (
    echo 设置OLLAMA_HOST失败，请用管理员权限运行。
    pause
    exit /b
)

:: 设置OLLAMA_ORIGINS环境变量并验证
setx OLLAMA_ORIGINS "*"
if %ERRORLEVEL% neq 0 (
    echo 设置OLLAMA_ORIGINS失败，请用管理员权限运行。
    pause
    exit /b
)
echo.
:: 尝试结束相关进程
taskkill /F /IM "ollama*.exe" >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo 没有找到需要结束的ollama*.exe程序，不过这不影响，继续处理...
)
echo.
:: 使用%USERPROFILE%环境变量来定位Ollama应用程序的位置
set "OLLAMA_PATH=%USERPROFILE%\AppData\Local\Programs\Ollama\ollama app.exe"
echo.
if exist "%OLLAMA_PATH%" (
    start "" "%OLLAMA_PATH%"
    echo 已尝试启动Ollama，请检查以确保它正在运行。
) else (
    echo 未能找到Ollama应用程序的位置：%OLLAMA_PATH%
)
echo.
echo 处理完成，可以关闭对话框了。
pause