all:
	apertium-validate-dictionary apertium-sh-ru.sh-ru.dix
	lt-comp lr apertium-sh-ru.sh-ru.dix sh-ru.autobil.bin
	lt-comp rl apertium-sh-ru.sh-ru.dix ru-sh.autobil.bin
	apertium-validate-dictionary apertium-sh-ru.ru.dix
	lt-comp rl apertium-sh-ru.sh-ru.dix sh-ru.autogen.bin
	lt-comp lr apertium-sh-ru.sh-ru.dix ru-sh.automorf.bin

