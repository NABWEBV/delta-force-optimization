@echo off
chcp 65001 >nul
title 三角洲行动 帧率优化脚本 - by NABWEBV
color 0A

echo ============================================
echo    三角洲行动 游戏帧率优化脚本
echo    GitHub: NABWEBV/delta-force-optimization
echo ============================================
echo.
echo  注意：脚本需要管理员权限运行
echo  建议右键 -> 以管理员身份运行
echo.
pause

echo.
echo [1/6] 切换到高性能电源计划...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo       完成

echo.
echo [2/6] 关闭Xbox后台录制...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
echo       完成

echo.
echo [3/6] 开启游戏模式...
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul
echo       完成

echo.
echo [4/6] 清理系统临时文件...
if defined temp (
    if exist "%temp%" (
        del /q /f /s "%temp%\*.*" >nul 2>&1
    )
)
if exist "C:\Windows\Temp" (
    del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1
)
if exist "C:\Windows\Prefetch" (
    del /q /f /s "C:\Windows\Prefetch\*.*" >nul 2>&1
)
echo       完成

echo.
echo [5/6] 优化网络延迟...
netsh int tcp set global autotuninglevel=normal >nul
netsh interface tcp set global rss=enabled >nul
echo       完成

echo.
echo [6/6] 关闭不必要的视觉效果...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo       完成

echo.
echo ============================================
echo    优化完成！建议重启电脑后生效
echo    游戏内画面设置请参考 OPTIMIZATION.md
echo ============================================
echo.
pause
