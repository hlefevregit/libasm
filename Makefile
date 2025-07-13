# === Variables ===
NAME     = libasm.a
AS       = nasm
ASFLAGS  = -f elf64
CC       = gcc
CFLAGS   = -Wall -Wextra -Werror
AR       = ar rcs
OBJDIR   = build

# === Fichiers ===
ASM_SRCS  := $(wildcard ft_*.asm)
OBJ_FILES := $(patsubst %.asm,$(OBJDIR)/%.o,$(ASM_SRCS))

# === Règles ===

all: $(NAME)

$(NAME): $(OBJ_FILES)
	$(AR) $@ $^

$(OBJDIR)/%.o: %.asm | $(OBJDIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(OBJDIR):
	mkdir -p $@

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME) test

re: fclean all

test:
ifndef name
	$(error ✖️  Veuillez fournir un nom : make test name=xxx)
endif
	$(CC) $(CFLAGS) ft_$(name)_main.c libasm.a -o test
	./test

.PHONY: all clean fclean re test
