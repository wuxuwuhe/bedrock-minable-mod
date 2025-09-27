@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem 确保 Gradle 包装器存在
if not exist "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" (
    echo ERROR: Gradle wrapper not found in %APP_HOME%\gradle\wrapper\gradle-wrapper.jar
    echo Please run "gradlew wrapper" to generate it.
    exit /b 1
)

@rem 执行 Gradle 命令
call "%JAVA_HOME%\bin\java.exe" %DEFAULT_JVM_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
