SRCS = Player.cpp main.cpp
PROG = player

PKG_CONFIG ?= pkg-config

CPPFLAGS += $(shell $(PKG_CONFIG) --cflags libavformat libavcodec libswresample libswscale libavutil sdl)
LIBS += \
	-lavformat \
	-lavcodec \
	-lswresample \
	-lswscale \
	-lavutil \
	-lSDL \
	-lorbital \
	-lz \
	-Wl,--whole-archive -lpthread -Wl,--no-whole-archive \
	-lm
#$(shell $(PKG_CONFIG) --libs libavformat libavcodec libswresample libswscale libavutil sdl)

$(PROG):$(SRCS)
	$(CXX) $(CPPFLAGS) -o $(PROG) $(SRCS) $(LDFLAGS) $(LIBS)

clean:
	rm $(PROG)
