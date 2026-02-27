PROD_PATH=../PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c
BIN_default_PATH=.
OBJ=$(BIN_default_PATH)/block.obj $(BIN_default_PATH)/sii_block_interface.obj $(BIN_default_PATH)/mei_block_interface.obj $(BIN_default_PATH)/galec_stl.obj
BIN=block.lib
_default_CC=cl /nologo /O2 /std:c17 /W4
_LD=lib /nologo

all: $(OBJ) $(BIN)

clean:
	DEL $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(_LD) $** /OUT:$@

$(BIN_default_PATH)/block.obj: $(PROD_PATH)/./block.c $(PROD_PATH)/./block.h
	@if not exist $(BIN_default_PATH) ( @md $(BIN_default_PATH) )
	$(_default_CC) /c $(PROD_PATH)/block.c /Fo$@

$(BIN_default_PATH)/sii_block_interface.obj: $(PROD_PATH)/./sii_block_interface.c $(PROD_PATH)/./sii_block_interface.h
	@if not exist $(BIN_default_PATH) ( @md $(BIN_default_PATH) )
	$(_default_CC) /c $(PROD_PATH)/sii_block_interface.c /Fo$@

$(BIN_default_PATH)/mei_block_interface.obj: $(PROD_PATH)/./mei_block_interface.c $(PROD_PATH)/./mei_block_interface.h
	@if not exist $(BIN_default_PATH) ( @md $(BIN_default_PATH) )
	$(_default_CC) /c $(PROD_PATH)/mei_block_interface.c /Fo$@

$(BIN_default_PATH)/galec_stl.obj: $(PROD_PATH)/./galec_stl.c $(PROD_PATH)/./galec_stl.h
	@if not exist $(BIN_default_PATH) ( @md $(BIN_default_PATH) )
	$(_default_CC) /c $(PROD_PATH)/galec_stl.c /Fo$@

