@echo off
for /r "%~1" %%f in (*.png *.jpg *.jpeg *.webp) do (
    magick "%%f" -negate "%%f"
)