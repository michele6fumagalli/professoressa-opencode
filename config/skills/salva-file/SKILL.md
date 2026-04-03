---
name: salva-file
description: Salva il contenuto di un documento come file .docx nella cartella Scuola sul Desktop, usando Pandoc. Chiede sempre conferma prima di salvare o sovrascrivere.
license: MIT
compatibility: opencode
metadata:
  audience: insegnanti
  workflow: gestione-file
---

## Cosa faccio

Converto il contenuto di un documento (in formato testo/markdown) in un file .docx e lo salvo nella cartella Scuola sul Desktop. Uso Pandoc per la conversione. Chiedo sempre conferma prima di salvare.

## Quando usarmi

Vengo chiamata automaticamente dalle altre skill (verbale-riunione, adatta-verifica, ricerca-web) quando l'utente vuole salvare un documento. Posso anche essere usata direttamente.

---

## Cartella di output

I file vengono salvati in:
```
PLACEHOLDER_OUTPUT_PATH
```
Esempio concreto (da sostituire): `C:\Users\maria\Desktop\Scuola`

Se la cartella non esiste, la creo automaticamente.

---

## Procedura passo per passo

### Passo 1 — Verifica Pandoc

Prima di qualsiasi operazione, verifica che Pandoc sia installato:

```bash
pandoc --version
```

- Se Pandoc risponde con la versione → procedi.
- Se Pandoc non è trovato → **fermati** e avvisa l'utente:

> "Pandoc non è installato su questo computer. Per salvare documenti .docx, è necessario installarlo. Chiedi a Michele di installarlo (comando: `winget install JohnMacFarlane.Pandoc`)."

Non procedere senza Pandoc installato.

---

### Passo 2 — Chiedi conferma del nome file

Prima di salvare, presenta all'utente:

```
Sto per salvare il documento con queste informazioni:
- Nome file: [nome_file_suggerito].docx
- Cartella: PLACEHOLDER_OUTPUT_PATH

Vuoi procedere, o preferisci un nome diverso?
```

Aspetta la conferma esplicita prima di procedere.

---

### Passo 3 — Controlla se il file esiste già

Verifica se esiste già un file con lo stesso nome nella cartella:

```bash
Test-Path "PLACEHOLDER_OUTPUT_PATH\[nome_file].docx"
```

- Se **non esiste** → procedi con il salvataggio.
- Se **esiste già** → avvisa l'utente:

> "Esiste già un file con questo nome: `[nome_file].docx`. Vuoi sovrascriverlo, oppure salvarlo con un nome diverso (es. `[nome_file]_v2.docx`)?"

Aspetta la risposta prima di procedere.

---

### Passo 4 — Salva il file

1. Scrivi il contenuto del documento in un file temporaneo `.md`:

```bash
# Il contenuto viene scritto in un file temporaneo
# Pandoc converte da markdown a docx
pandoc "[file_temp].md" -o "PLACEHOLDER_OUTPUT_PATH\[nome_file].docx" --standalone
```

2. Verifica che il file sia stato creato:

```bash
Test-Path "PLACEHOLDER_OUTPUT_PATH\[nome_file].docx"
```

---

### Passo 5 — Conferma all'utente

Dopo il salvataggio riuscito, comunica:

> "Il file è stato salvato correttamente:
> `PLACEHOLDER_OUTPUT_PATH\[nome_file].docx`
>
> Puoi trovarlo sul Desktop, nella cartella Scuola."

Se il salvataggio fallisce, comunica l'errore in modo comprensibile (non mostrare codice tecnico grezzo) e suggerisci cosa fare.

---

## Note tecniche

- Pandoc deve essere installato: `winget install JohnMacFarlane.Pandoc`
- Il flag `--standalone` produce un .docx completo apribile in Word
- PLACEHOLDER_OUTPUT_PATH deve essere il percorso completo Windows, es: `C:\Users\maria\Desktop\Scuola`
- I file temporanei vengono creati e poi eliminati automaticamente dopo la conversione
- Per personalizzare lo stile del .docx (font, margini, intestazione della scuola), si può aggiungere un file `reference.docx` nella cartella config — PLACEHOLDER_REFERENCE_DOCX (opzionale, da configurare in seguito)
