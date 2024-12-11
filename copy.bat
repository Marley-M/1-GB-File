@echo off

set counter=1

:loop
	if not exist "file.txt" (
		goto missing_file
	)
	copy "file.txt" "file%counter%.txt"
	set /A counter+=1
	goto loop

:missing_file
	echo "file.txt" does not exist
	echo Do you want to download it?
	pause
	wget https://raw.githubusercontent.com/Marley-M/Storage-Eater/refs/heads/downloads/file.txt
	del .wget-hsts
	echo resume script?
	pause
	goto loop
