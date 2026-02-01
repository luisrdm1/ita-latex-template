# Diretório onde os arquivos temporários e o PDF serão
# gerados.
#
# Mantenha sincronizado com o valor em .gitignore
OUT_DIR ?= target

# Usa wildcard (funciona em Windows e Unix)
TEX_SRCS := $(wildcard *.tex) $(wildcard */*.tex) $(wildcard */*/*.tex)
BIB_SRCS := $(wildcard *.bib) $(wildcard */*.bib)
IMG_SRCS := $(wildcard *.jpg) $(wildcard */*.jpg) $(wildcard *.png) $(wildcard */*.png) $(wildcard *.eps) $(wildcard */*.eps)

SRCS := $(TEX_SRCS) $(BIB_SRCS) $(IMG_SRCS)

# Detecta Windows vs Unix
ifeq ($(OS),Windows_NT)
    MKDIR = if not exist $(OUT_DIR) mkdir $(OUT_DIR)
    RM = if exist $(OUT_DIR) rmdir /s /q $(OUT_DIR)
else
    MKDIR = mkdir -p $(OUT_DIR)
    RM = rm -rf $(OUT_DIR)
endif

# Compilar a versão final do PDF.
pdf: $(OUT_DIR)/tese.pdf

clean:
	$(RM)

$(OUT_DIR)/tese.pdf: $(SRCS)
	$(MKDIR)
	pdflatex -output-directory=$(OUT_DIR) tese.tex
	biber --input-directory=$(OUT_DIR) --output-directory=$(OUT_DIR) tese
	pdflatex -output-directory=$(OUT_DIR) tese.tex
	pdflatex -output-directory=$(OUT_DIR) tese.tex
	pdflatex -output-directory=$(OUT_DIR) tese.tex

.PHONY: pdf clean
