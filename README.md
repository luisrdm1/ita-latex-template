# Template ITA - Dissertações e Teses

Template LaTeX para dissertações e teses do Instituto Tecnológico de Aeronáutica (ITA), em conformidade com as normas ABNT.

## Como Usar

1. Clone ou baixe este repositório
2. Abra `tese.tex` e preencha os campos marcados em **vermelho** (autor, título, orientador, banca, etc.)
3. Edite os arquivos em `PreTextuais/` (dedicatória, agradecimentos, resumo, abstract)
4. Substitua o conteúdo dos capítulos em `Cap1/` a `Cap8/`
5. Adicione suas referências em `Referencias/referencias.bib`
6. Compile com `make pdf`

> **Dica:** Campos a preencher usam o comando `\placeholder{...}` e aparecem em vermelho no PDF. Remova o `\placeholder` ao preencher.

## Características

- **BibLaTeX + Biber** com estilo ABNT (NBR 6023:2018) e backref
- **Acrônimos automáticos** com o pacote `acro` (expansão na primeira ocorrência, lista com backref de páginas)
- **Aspas tipográficas automáticas** com `csquotes`
- **Listas conforme ABNT NBR 6024** (alíneas com letras, subalíneas com travessão)
- **Hyperlinks** no PDF (sumário, referências, citações)
- **Fontes**: Libertinus (texto e matemática) + Source Code Pro (monoespaçado)
- Suporte a TG, Mestrado, Doutorado e Qualificação
- Versões em português e inglês

## Compilação

Requer uma distribuição LaTeX com `pdflatex` e `biber`.

```bash
make pdf        # Compila o PDF (target/tese.pdf)
make clean      # Remove arquivos temporários
```

Ou manualmente:
```bash
pdflatex -output-directory=target tese.tex
biber --input-directory=target --output-directory=target tese
pdflatex -output-directory=target tese.tex
pdflatex -output-directory=target tese.tex
pdflatex -output-directory=target tese.tex
```

## Estrutura

```
tese.tex              # Documento principal
ita.cls               # Classe do documento
ita/                  # Definições por tipo de trabalho
PreTextuais/          # Resumo, abstract, agradecimentos, acrônimos
Cap1/ ... Cap8/       # Capítulos
ApeA/                 # Apêndices
AneA/                 # Anexos
Referencias/          # Arquivo .bib
target/               # Saída (PDF e auxiliares)
```

## Configuração

No `tese.tex`, configure o tipo de documento:

```latex
\documentclass[msc]{ita}      % Mestrado
\documentclass[dsc]{ita}      % Doutorado
\documentclass[tg]{ita}       % Trabalho de Graduação
\documentclass[msc, eng]{ita} % Mestrado em inglês
```

## Acrônimos

Defina em `PreTextuais/abreviaturas.tex`:

```latex
\DeclareAcronym{ITA}{
  short = ITA,
  long  = Instituto Tecnológico de Aeronáutica,
}
```

Use no texto:
- `\ac{ITA}` — primeira vez expande, depois só sigla
- `\acs{ITA}` — sempre só sigla
- `\acl{ITA}` — sempre forma longa

## Licença

Apache 2.0 — veja [LICENSE](LICENSE).

## Origem

Baseado no template original de Fábio Fagundes Silveira et al., com contribuições da comunidade ITA e adaptações para BibLaTeX/ABNT.
