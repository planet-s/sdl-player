CPPFLAGS := -std=c++11 -g -Wall
SRCS = Player.cpp main.cpp
PROG = player

PKG_CONFIG ?= pkg-config

FFMPEG_1 = `$(PKG_CONFIG) --cflags libavformat libavcodec libswresample libswscale libavutil`
SDL = `$(PKG_CONFIG) --libs libavformat libavcodec libswresample libswscale libavutil sdl`

LIBS := $(FFMPEG_1)
LIBS := $(SDL)

$(PROG):$(SRCS)
	$(CXX) $(CPPFLAGS) -o $(PROG) $(SRCS) $(LIBS)

clean:
	rm $(PROG)
