NAME := bfjit

all: run

assemble:
	as $(NAME).s -o $(NAME).o
	gcc $(NAME).s -o $(NAME)

compile:
	gcc -S -O0 $(NAME).c -o $(NAME)_gen.s

debug: assemble
	gdb ./$(NAME) 


clean:
	rm -f ./$(NAME)_gen.s
	rm -f ./$(NAME).o
	rm -f ./$(NAME)
	rm -f ./a.out

run: assemble
	./$(NAME) < hello.bf ; echo $$?
	
valgrind: assemble
	valgrind ./$(NAME) < hello.bf 
