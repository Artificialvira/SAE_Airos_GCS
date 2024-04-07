@echo off


set /p commitMsg="Enter your commit message (avoid embedding quotes): "


if "%commitMsg%"=="" (
  echo Please enter a commit message. Exiting...
  exit /b 1
)

echo Adding all modified files...
git add .

if %errorlevel% neq 0 (
  echo Error: Failed to add files. Please check your repository status.
  exit /b 1
)

echo Committing changes with message: %commitMsg%
git commit -m "%commitMsg%"

if %errorlevel% neq 0 (
  echo Error: Failed to commit changes. Please check your repository status.
  exit /b 1
)

echo Pulling changes from remote... (This will now be the second-to-last step)
git pull

if %errorlevel% neq 0 (
  echo Error: Failed to pull changes. Please check your connection or repository status.
  exit /b 1
)

echo Pushing changes to remote...
git push

if %errorlevel% neq 0 (
  echo Error: Failed to push changes. Please check your credentials or remote repository status.
  exit /b 1
)



echo Done! Changes pushed and pulled successfully.

pause
