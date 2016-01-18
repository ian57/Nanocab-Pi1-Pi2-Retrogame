#EXECS = retrogame gamera
EXECS = retrogame 
#TOOLS_DIR="/opt/rpi_tools"
#CCPREFIX=${TOOLS_DIR}/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi-
#ARCH=arm 
#CROSS_COMPILE=${CCPREFIX} 

#CC    = ARCH=arm /opt/rpi_tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi-gcc $(CFLAGS) -Wall -O3 -fomit-frame-pointer -funroll-loops -s
CC    = gcc $(CFLAGS) -Wall -O3 -fomit-frame-pointer -funroll-loops -s

all: $(EXECS)

retrogame: retrogame.c
	$(CC) $< -o $@

gamera: gamera.c
	$(CC) $< -lncurses -lmenu -lexpat -o $@

install:
	mv $(EXECS) /usr/local/bin

clean:
	rm -f $(EXECS)
