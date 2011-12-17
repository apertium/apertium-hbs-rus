all:
	apertium-validate-dictionary apertium-sh-ru.sh-ru.dix
	lt-comp lr apertium-sh-ru.sh-ru.dix sh-ru.autobil.bin
	lt-comp rl apertium-sh-ru.sh-ru.dix ru-sh.autobil.bin
