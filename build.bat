@echo off

set TOOLCHAIN=%1
set OLDPATH=%path%

if %TOOLCHAIN% equ msvc2013 (
    call "%VS120COMNTOOLS%../../VC/bin/amd64/vcvars64.bat"
    set VCVALUE=12
) else if %TOOLCHAIN% equ msvc2015 (
    call "%VS140COMNTOOLS%../../VC/bin/amd64/vcvars64.bat"
    set VCVALUE=14
) else (
    echo Failure: unknown msvc version %TOOLCHAIN%
    exit /b /1
)

pushd curl
cd winbuild
call nmake Makefile.vc mode=static MACHINE=x64 VC=%VCVALUE% ENABLE_WINSSL=no

set PATH=%OLDPATH%
popd
