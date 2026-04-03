---
name: verbale-riunione
description: Crea verbali formattati per riunioni scolastiche (consiglio di classe, collegio docenti, ecc.) partendo da una bozza o appunti. Salva il risultato come .docx.
license: MIT
compatibility: opencode
metadata:
  audience: insegnanti
  workflow: documenti-scolastici
---

## Cosa faccio

Trasformo bozze o appunti di riunioni scolastiche in verbali formattati secondo il modello standard, pronti per essere salvati come .docx.

## Quando usarmi

Usami quando hai appunti o una bozza di una riunione scolastica e vuoi un verbale formale e ben strutturato.

---

## Procedura passo per passo

### Passo 1 — Raccogli le informazioni

Chiedi all'utente le seguenti informazioni. Fai UNA domanda alla volta se non sono già presenti nella richiesta:

1. **Tipo di riunione**: Consiglio di Classe, Collegio Docenti, Riunione con genitori, Commissione, altro?
2. **Data e ora** della riunione
3. **Luogo** (es. Aula Magna, Sala Professori, online)
4. **Partecipanti**: chi era presente? Chi era assente giustificato?
5. **Bozza o appunti**: chiedi di incollare il testo della riunione

Se manca qualcosa di essenziale, chiedi. Se manca qualcosa di secondario, usa un segnaposto come `[DA COMPILARE]`.

---

### Passo 2 — Applica il formato standard

Usa questo modello per strutturare il verbale:

```
PLACEHOLDER_SCHOOL_NAME
[TIPO DI RIUNIONE]

VERBALE N. [numero] — Anno Scolastico [anno]

Data: [data]
Ora inizio: [ora]  |  Ora fine: [ora o "in corso"]
Luogo: [luogo]

PRESENTI:
[elenco]

ASSENTI GIUSTIFICATI:
[elenco o "nessuno"]

PRESIEDE: [nome presidente/dirigente]
VERBALIZZA: PLACEHOLDER_TEACHER_NAME

---

ORDINE DEL GIORNO:
1. [punto 1]
2. [punto 2]
...

---

SVOLGIMENTO

[Punto 1 — titolo]
[Sintesi discussione. Indicare chi ha parlato solo se rilevante. Indicare eventuali posizioni diverse.]

[Punto 2 — titolo]
[...]

---

DELIBERE E DECISIONI:
- [delibera 1]
- [delibera 2]
(oppure: "Nessuna delibera formale adottata.")

---

Letto, approvato e sottoscritto.

PLACEHOLDER_TEACHER_NAME (verbalizzante)          _______________________

[Nome Presidente/Dirigente]                        _______________________

Data di approvazione: _______________
```

**Regole di scrittura del verbale:**
- Usa la terza persona e il passato remoto o imperfetto ("Il dirigente ha illustrato...", "La professoressa ha proposto...")
- Sintesi fedele: non aggiungere informazioni non presenti nella bozza
- Se la bozza è confusa o incompleta, segnala i punti incerti con `[DA VERIFICARE: ...]`
- Non inventare nomi, delibere o decisioni

---

### Passo 3 — Mostra e spiega

Prima di salvare:
1. Mostra il verbale formattato completo
2. Elenca le scelte fatte: "Ho strutturato il punto X così perché..."
3. Segnala eventuali parti mancanti o incerte
4. Chiedi: "Va bene così, o vuoi modificare qualcosa?"

---

### Passo 4 — Salva il file

Solo dopo approvazione dell'utente, usa la skill **salva-file** con:
- Contenuto: il verbale formattato
- Nome file suggerito: `Verbale_[TipoRiunione]_[Data].docx` (es. `Verbale_CdC_15-03-2026.docx`)
- Conferma il nome con l'utente prima di salvare

---

## Note importanti

- PLACEHOLDER_SCHOOL_VERBALE_TEMPLATE — se la scuola ha un suo modello ufficiale diverso da quello generico sopra, sostituisci il formato nel Passo 2 con il modello specifico della scuola.
- Il verbale contiene dati personali: non condividere fuori dalla sessione.
