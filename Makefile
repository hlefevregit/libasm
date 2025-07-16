# === Variables ===
NAME     = libasm.a
AS       = nasm
ASFLAGS  = -f elf64
CC       = gcc
CFLAGS   = -Wall -Wextra -Werror -g
AR       = ar rcs
OBJDIR   = build
BONUSDIR = bonus/
BONUSBUILDDIR = $(OBJDIR)/bonus
MAINDIR  = mains/

# === Fichiers ===
ASM_SRCS  := ft_write.asm \
			 ft_strlen.asm \
			 ft_strcpy.asm \
			 ft_strcmp.asm \
			 ft_read.asm \
			 ft_strdup.asm

OBJ_FILES := $(patsubst %.asm,$(OBJDIR)/%.o,$(ASM_SRCS))

BONUS_SRCS := bonus/ft_value.asm \
			  bonus/ft_atoi_base_bonus.asm \
			  bonus/ft_list_push_front_bonus.asm \
			  bonus/ft_list_size_bonus.asm \
			  bonus/ft_list_sort_bonus.asm \
			  bonus/ft_list_remove_if_bonus.asm

BONUS_OBJS := $(patsubst $(BONUSDIR)%.asm,$(BONUSBUILDDIR)/%.o,$(BONUS_SRCS))

BONUS_C_SRCS := bonus/free_wrapper.c
BONUS_C_OBJS := $(patsubst $(BONUSDIR)%.c,$(BONUSBUILDDIR)/%.o,$(BONUS_C_SRCS))

# === Règles ===

all: $(NAME)

$(NAME): $(OBJ_FILES)
	@$(AR) $@ $^

bonus: $(OBJ_FILES) $(BONUS_OBJS) $(BONUS_C_OBJS)
	@$(AR) $(NAME) $^

$(OBJDIR)/%.o: %.asm | $(OBJDIR)
	@$(AS) $(ASFLAGS) -o $@ $<

$(BONUSBUILDDIR)/%.o: $(BONUSDIR)%.asm | $(BONUSBUILDDIR)
	@$(AS) $(ASFLAGS) -o $@ $<

$(BONUSBUILDDIR)/%.o: $(BONUSDIR)%.c | $(BONUSBUILDDIR)
	@$(CC) $(CFLAGS) -fPIC -c $< -o $@

$(OBJDIR):
	mkdir -p $@

$(BONUSBUILDDIR):
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
	@$(CC) $(CFLAGS) $(MAINDIR)ft_$(name)_main.c libasm.a -o test
	./test

bonus_test:
ifndef name
	$(error ✖️  Veuillez fournir un nom : make bonus_test name=xxx)
endif
	@$(MAKE) bonus
	@$(CC) $(CFLAGS) $(MAINDIR)ft_$(name)_main.c libasm.a -o test
	@./test

.PHONY: all clean fclean re test bonus bonus_test
