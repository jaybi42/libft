
UNAME			:= $(shell uname | cut -c1-6)

# ============================================================================ #
# Sources Directories

# include search path for .o dependencies
MKGEN_INCLUDESDIRS		:= include
# Obj files directory
MKGEN_OBJDIR			:= obj
# Source files directories
MKGEN_SRCSDIRS_BLABLA	:= src


# ============================================================================ #
# Default  flags
BASE_FLAGS		= -Wall -Wextra -g3
HEAD_FLAGS		= $(addprefix -I,$(INCLUDEDIRS))
LD_FLAGS		=

MAKEFLAGS		+= -j


# ============================================================================ #
#	NAME		link; target
#	CC_LD		link; ld
#	SRCSBIN		separate compilation; targets
#	INCLUDEDIRS	separate compilation; sources includes path

NAME			:= libft.a
CC_LD			= $(CC_AR)
LD_FLAGS		+=

SRCSBIN			= $(MKGEN_SRCSBIN_BLABLA) #gen by mkgen
INCLUDEDIRS		= $(MKGEN_INCLUDESDIRS)

# ============================================================================ #
# Compilers
C_FLAGS			= $(HEAD_FLAGS) $(BASE_FLAGS)

ifeq ($(UNAME),LINUX)
  #linux compilation
else
  #macos compilation
  CC_C			= clang
  CC_AR			= ar
endif

ifeq ($(CC_LD),$(CC_AR))
  LD_FLAGS_		= rcs $@ $(LD_FLAGS)
else
  LD_FLAGS_		= -o $@ $(LD_FLAGS) $(BASE_FLAGS)
endif


# ============================================================================ #
# Misc
PRINT_OK		= printf '  \033[32m$<\033[0m\n'
PRINT_LINK		= printf '\033[32m$@\033[0m\n'
PRINT_MAKE		= printf '\033[32mmake $@\033[0m\n'
DEPEND			:= depend.mk
SHELL			:= /bin/bash

# ============================================================================ #
# Rules

# Default rule (needed to be before include)
all: _all_separate_compilation

-include $(DEPEND)

_all_separate_compilation: $(SRCSBIN)
	$(MAKE) _all_linkage

_all_linkage: $(NAME)

# Linking
$(NAME): $(LIBSBIN) $(SRCSBIN)
	$(CC_LD) $(LD_FLAGS_) $(SRCSBIN) && $(PRINT_LINK)

# Compiling
$(MKGEN_OBJDIR)/%.o: %.c
	$(CC_C) $(C_FLAGS) -c $< -o $@ && $(PRINT_OK)

# Create obj directories
$(MKGEN_OBJDIR)/%/:
	mkdir -p $@

# Clean obj files
clean:
	rm -f $(SRCSBIN)

# Clean everything
fclean: clean
	rm -f $(NAME)

# Clean and make
re: fclean
	$(MAKE) all


# ============================================================================ #
# Special targets
.SILENT:
.PHONY: all clean fclean re _all_separate_compilation _all_linkage $(LIBSMAKE)
