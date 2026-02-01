# Nome do arquivo principal (sem extensão)
DOCNAME = tese

# Diretório de saída (sincronizado com .gitignore)
OUT_DIR = target

# Latexmk com pdflatex
# -pdf: gera PDF
# -interaction=nonstopmode: não trava em erros
# -synctex=1: navegação PDF<->editor
# -outdir: arquivos de saída no target/
LATEXMK = latexmk -pdf \
    -pdflatex="pdflatex -interaction=nonstopmode -synctex=1" \
    -outdir=$(OUT_DIR)

# Detecta Windows vs Unix para limpeza
ifeq ($(OS),Windows_NT)
    RM_DIR = if exist $(OUT_DIR) rmdir /s /q $(OUT_DIR)
else
    RM_DIR = rm -rf $(OUT_DIR)
endif

# Regra padrão
all: pdf

# Compila o PDF (latexmk gerencia dependências e número de execuções)
pdf: $(DOCNAME).tex
	$(LATEXMK) $<

# Compilação contínua - recompila ao salvar
watch: $(DOCNAME).tex
	$(LATEXMK) -pvc $<

# Limpeza completa
clean:
	$(LATEXMK) -C $(DOCNAME).tex
	$(RM_DIR)

.PHONY: all pdf watch clean
