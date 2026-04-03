---
name: ricerca-web
description: Esegue ricerche online su argomenti didattici o scolastici. Produce una sintesi strutturata in italiano con elenco obbligatorio delle fonti utilizzate (titolo, URL, data).
license: MIT
compatibility: opencode
metadata:
  audience: insegnanti
  workflow: ricerca-didattica
---

## Cosa faccio

Cerco informazioni online su argomenti didattici, produco una sintesi chiara e strutturata in italiano, e fornisco sempre un elenco completo delle fonti usate. Non invento mai informazioni: se non trovo qualcosa, lo dico.

## Quando usarmi

Usami quando hai bisogno di:
- Approfondire un argomento da spiegare in classe
- Trovare materiali, attività o metodologie didattiche
- Cercare informazioni normative (leggi scolastiche, circolari MIUR)
- Fare una ricerca per preparare un documento o una presentazione

---

## Procedura passo per passo

### Passo 1 — Definisci la ricerca

Chiedi all'utente (una domanda alla volta se necessario):

1. **Argomento** — cosa vuole sapere esattamente?
2. **Scopo** — è per spiegarlo in classe? Per un documento ufficiale? Per uso personale?
3. **Livello di approfondimento**:
   - Panoramica rapida (5-10 minuti di lettura)
   - Approfondimento medio (testo completo strutturato)
   - Ricerca dettagliata (più fonti, confronto)
4. **Lingua delle fonti** — accetta solo fonti in italiano, o anche in inglese?

---

### Passo 2 — Esegui la ricerca

- Usa il tool di ricerca web per trovare informazioni sull'argomento.
- **Priorità alle fonti istituzionali italiane**: siti .gov.it, miur.gov.it, istruzione.it, gazzettaufficiale.it, iss.it, treccani.it, enciclopedie universitarie.
- Per argomenti didattici in inglese: Cambridge, British Council, BBC Learning English, riviste accademiche peer-reviewed.
- **Evita**: siti senza autore identificabile, blog personali senza fonti, Wikipedia come fonte primaria (può essere usata come punto di partenza, non come fonte definitiva).

Durante la ricerca, annota per ogni fonte:
- Titolo della pagina/articolo
- URL completo
- Data di pubblicazione (se disponibile) o data di accesso
- Chi ha scritto il contenuto (autore/ente)

---

### Passo 3 — Valuta l'affidabilità delle fonti

Per ogni fonte trovata, valuta:
- **Chi l'ha scritta?** Ente ufficiale, esperto del settore, o autore non verificabile?
- **Quando?** L'informazione è aggiornata?
- **Confermata da altre fonti?** Se un'informazione appare solo in una fonte, segnalalo.

Se una fonte è di qualità incerta, indicalo esplicitamente: "Questa informazione proviene da [fonte] — ti consiglio di verificarla."

---

### Passo 4 — Scrivi la sintesi

Struttura il risultato così:

```
RICERCA: [Titolo argomento]
Data ricerca: [data odierna]
Scopo: [come indicato dall'utente]

---

## Sintesi

[Testo strutturato in sezioni con titoli. Usa paragrafi brevi e chiari.
Quando una frase si basa direttamente su una fonte specifica, aggiungi [Fonte N] in linea.]

---

## Punti chiave

- [punto 1]
- [punto 2]
- [punto 3]
...

---

## Cosa non ho trovato / Limitazioni

[Se ci sono aspetti della domanda che non hai potuto rispondere con fonti affidabili, dillo qui.
Es: "Non ho trovato dati aggiornati su X — ti consiglio di verificare direttamente con [ente]."]

---

## Fonti utilizzate

1. [Titolo] — [Ente/Autore] — [URL] — Accesso: [data]
2. [Titolo] — [Ente/Autore] — [URL] — Accesso: [data]
...
```

**Regole sulla sintesi:**
- Scrivi in italiano, chiaro e accessibile
- Non aggiungere mai informazioni non trovate nelle fonti
- Distingui fatti accertati da opinioni o interpretazioni
- Se due fonti si contraddicono, presentale entrambe: "Secondo X... mentre secondo Y..."

---

### Passo 5 — Proponi il salvataggio

Dopo aver mostrato la sintesi, chiedi:
"Vuoi che salvi questa ricerca come documento .docx?"

Se sì, usa la skill **salva-file** con:
- Nome file suggerito: `Ricerca_[Argomento]_[Data].docx`
- Es: `Ricerca_MetodologiaClil_03-04-2026.docx`

---

## Note importanti

- **La sezione "Fonti utilizzate" è obbligatoria.** Non consegnare mai una ricerca senza fonti.
- Se non riesci a trovare fonti affidabili su un argomento, dì chiaramente: "Non ho trovato fonti sufficientemente affidabili su questo argomento. Ti consiglio di [alternativa]."
- Per informazioni normative (leggi, circolari), cita sempre il numero e la data del provvedimento ufficiale.
- Non usare il futuro semplice per presentare fatti ("sarà così") — usa il presente o riferisci alla fonte ("secondo il MIUR, ...").
