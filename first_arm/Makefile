NAME:=first

all: assemble run

assemble:
	as $(NAME).s -o $(NAME).o
	gcc $(NAME).o -marm -g -O0 -o $(NAME)

compile:
	gcc -marm -S -g -O0 $(NAME).c -o $(NAME)_gen.s

debug: assemble
	gdb ./$(NAME)


clean:
	rm -f $(NAME)_gen.s
	rm -f $(NAME).o
	rm -f $(NAME)

run:
	./$(NAME) ; echo $$?
	
