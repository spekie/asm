AS = as
LD = ld
OUT = maximum
SRC = $(OUT).s
OBJ = $(OUT).o

$(OUT): $(OBJ)
	$(LD) $(OBJ) -o $(OUT)

$(OBJ): $(SRC)
	$(AS) -o $(OBJ) $(SRC)

clean:
	rm -f $(OBJ) $(OUT)
