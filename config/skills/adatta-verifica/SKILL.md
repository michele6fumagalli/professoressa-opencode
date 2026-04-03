---
name: adatta-verifica
description: Adatta verifiche e test scolastici per alunni con DSA (dislessia, disgrafia, discalculia), BES o disabilità, secondo la normativa italiana vigente. Spiega ogni modifica apportata.
license: MIT
compatibility: opencode
metadata:
  audience: insegnanti
  workflow: inclusione-scolastica
---

## Cosa faccio

Adatto verifiche e test scolastici per alunni con bisogni educativi speciali, applicando le indicazioni della normativa italiana (Legge 170/2010, DM 12 luglio 2011, D.Lgs 66/2017). Spiego ogni modifica apportata e il motivo.

## Quando usarmi

Usami quando hai una verifica da adattare per uno o più alunni con DSA, BES o disabilità.

---

## Normativa di riferimento

Le modifiche si basano su:
- **Legge 170/2010** — Nuove norme in materia di disturbi specifici di apprendimento
- **DM 12 luglio 2011** — Linee guida per il diritto allo studio degli alunni con DSA
- **D.Lgs 66/2017** — Inclusione scolastica degli alunni con disabilità
- **Nota MIUR 562/2013** — Strumenti compensativi e dispensativi
- **PLACEHOLDER_PDP_FORMAT** — Se la scuola ha un formato PDP/PEI specifico, le modifiche tengono conto di quel documento

---

## Procedura passo per passo

### Passo 1 — Raccogli le informazioni

Chiedi all'utente (una domanda alla volta se non già fornite):

1. **Il testo della verifica originale** — chiedi di incollarlo
2. **Tipo di bisogno** dell'alunno:
   - DSA: specificare quale (dislessia, disgrafia, disortografia, discalculia)
   - BES senza diagnosi clinica
   - Disabilità (specificare se possibile: motoria, visiva, cognitiva lieve/grave)
   - Più tipi insieme
3. **Misure già previste nel PDP/PEI** dell'alunno (se le conosce): es. "tempo aggiuntivo 30%", "uso calcolatrice", "testo ingrandito"
4. **Materia e classe** — per contestualizzare il livello

Se non conosce le misure del PDP, procedi con le indicazioni standard della normativa.

---

### Passo 2 — Analizza la verifica originale

Prima di modificare, analizza ad alta voce:
- Quante domande ci sono e di che tipo (aperte, chiuse, a scelta multipla, completamento)
- Quali elementi potrebbero essere problematici per il tipo di bisogno indicato
- Cosa può restare invariato

Mostra questa analisi all'utente: "Ho analizzato la verifica. Ecco cosa ho trovato: ..."

---

### Passo 3 — Applica le modifiche appropriate

Applica le modifiche in base al tipo di bisogno. Per ogni modifica, annota il motivo.

#### Per DISLESSIA
- Aumenta la dimensione del font (indica: Arial 14 o simile, interlinea 1.5)
- Evidenzia le parole chiave delle consegne in **grassetto**
- Spezza le consegne lunghe in frasi più brevi
- Riduci la quantità di testo da leggere dove possibile (senza togliere contenuto)
- Aggiungi immagini di supporto se pertinenti (indica il tipo, non crearle)
- Indica: "Autorizzato l'uso del dizionario / sintesi vocale"

#### Per DISGRAFIA / DISORTOGRAFIA
- Preferisci domande a scelta multipla o vero/falso rispetto alle risposte aperte lunghe
- Se rimangono risposte aperte, riduci la lunghezza richiesta
- Indica: "Non vengono valutati gli errori ortografici"
- Indica: "Autorizzato l'uso del computer per la scrittura"

#### Per DISCALCULIA
- Permetti l'uso della calcolatrice (indicalo esplicitamente)
- Permetti l'uso di tavole numeriche o formulari
- Riduci il numero di calcoli ripetitivi (mantieni la varietà tipologica)
- Indica: "Autorizzato l'uso di tavola pitagorica / formulario"

#### Per BES (senza diagnosi clinica)
- Semplifica il lessico delle consegne senza abbassare il livello concettuale
- Aggiungi esempi chiarificatori dove utile
- Considera tempo aggiuntivo (indicalo: "+30% del tempo previsto")

#### Per DISABILITÀ COGNITIVA LIEVE
- Riduci il numero di domande mantenendo i concetti chiave
- Usa linguaggio semplice e frasi brevi
- Privilegia domande chiuse (scelta multipla, vero/falso, abbinamento)
- Aggiungi supporti visivi (indicali)

#### Per DISABILITÀ GRAVE / PEI differenziato
- La verifica va completamente ridisegnata in base agli obiettivi del PEI
- Chiedi all'utente quali sono gli obiettivi minimi previsti dal PEI
- Crea domande che valutano solo quegli obiettivi
- Indica chiaramente: "Verifica differenziata — obiettivi PEI"

---

### Passo 4 — Presenta il risultato con spiegazioni

Presenta la verifica adattata in questo formato:

```
VERIFICA ADATTATA
Alunno/a: [non scrivere il nome — usa "Alunno con DSA/BES"]
Materia: [materia] — Classe: [classe]
Tipo di adattamento: [DSA/BES/disabilità]
Strumenti compensativi autorizzati: [elenco]
Misure dispensative applicate: [elenco]
Tempo aggiuntivo: [sì/no — percentuale]

---
[TESTO DELLA VERIFICA ADATTATA]
---

MODIFICHE APPORTATE:
1. [Modifica] — Motivo: [perché, con riferimento normativo se pertinente]
2. [Modifica] — Motivo: [...]
...

COSA NON HO MODIFICATO E PERCHÉ:
- [Elemento] — Motivo: [...]
```

---

### Passo 5 — Chiedi revisione e salva

1. Chiedi: "Vuoi modificare qualcosa prima di salvare?"
2. Solo dopo approvazione, usa la skill **salva-file** con:
   - Nome file suggerito: `Verifica_[Materia]_[Classe]_Adattata_[TipoBES].docx`
   - Es: `Verifica_Inglese_3A_Adattata_DSA.docx`

---

## Note importanti

- Non scrivere mai il nome dell'alunno nel file salvato — usa "Alunno con DSA" o simile (privacy)
- Le modifiche devono **mantenere la valenza valutativa** della verifica — non si abbassa il livello, si rimuovono le barriere
- Se non sei sicura di una modifica specifica, segnalala: "Su questo punto ti consiglio di verificare con il referente DSA della scuola"
- PLACEHOLDER_PDP_FORMAT — se disponibile il formato PDP/PEI della scuola, aggiorna questa skill con le indicazioni specifiche
