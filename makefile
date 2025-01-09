CC=gcc -std=gnu99

CFLAGS=-Wall -Wextra -pedantic

ASAN?=0
ifeq ($(ASAN),1)
CFLAGS+=-g3 -fanalyzer -fno-inline -fstack-protector-all -fsanitize=address -fno-omit-frame-pointer
endif


DEBUG?=0
ifeq ($(DEBUG),1)
CFLAGS+=-g3 -fno-inline -fstack-protector-all -fno-omit-frame-pointer
endif

ifeq ($(DEBUG),0)
ifeq ($(ASAN),0)
CFLAGS+=-O3
LDFLAGS+=-flto
endif
endif

FILES=ftab_ut.c ftab.c

ftab_ut: ftab.c
	$(CC) $(FILES) $(CFLAGS) -o ftab_ut
