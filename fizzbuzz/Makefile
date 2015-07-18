NAME := fizzbuzz

all: assemble run

assemble:
	as $(NAME).s -o $(NAME).o
	gcc $(NAME).o -o $(NAME)

compile:
	gcc -S -O0 $(NAME).c -o $(NAME)_gen.s

debug: assemble
	gdb ./$(NAME)


clean:
	rm -f ./$(NAME)_gen.s
	rm -f ./$(NAME).o
	rm -f ./$(NAME)
	rm -f ./a.out

run:
	./$(NAME) ; echo $$?
	
