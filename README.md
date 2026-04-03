# Professoressa OpenCode — Setup Guide

Questo progetto configura OpenCode come assistente personale per un'insegnante.
Gestito da Michele. Non modificare i file direttamente sulla macchina — aggiorna il repo e lascia che il sync notturno faccia il resto.

---

## Struttura del progetto

```
professoressa-project/
├── README.md                          ← questa guida
├── setup/
│   └── sync-skills.ps1               ← script per aggiornamento automatico notturno
└── config/                           ← va copiato in ~/.config/opencode/ sulla sua macchina
    ├── AGENTS.md                     ← regole globali dell'agente
    ├── opencode.json                 ← configurazione modello e permessi
    ├── agents/
    │   └── professoressa.md          ← agente principale
    └── skills/
        ├── verbale-riunione/SKILL.md ← verbali riunioni scolastiche
        ├── adatta-verifica/SKILL.md  ← adattamento verifiche DSA/BES
        ├── ricerca-web/SKILL.md      ← ricerche online con fonti
        └── salva-file/SKILL.md       ← salvataggio .docx via Pandoc
```

---

## Placeholder da completare

Tutti i segnaposto nel codice sono nel formato `PLACEHOLDER_*`. Questa tabella elenca ogni modifica necessaria prima del deploy.

| # | Placeholder | File/i interessati | Cosa inserire |
|---|---|---|---|
| 1 | `PLACEHOLDER_OUTPUT_PATH` | `config/AGENTS.md`, `config/skills/salva-file/SKILL.md`, `setup/sync-skills.ps1` | Percorso cartella output, es: `C:\Users\maria\Desktop\Scuola` |
| 2 | `PLACEHOLDER_WINDOWS_USERNAME` | `setup/sync-skills.ps1` | Nome utente Windows della macchina, es: `maria` |
| 3 | `PLACEHOLDER_GITHUB_REPO_URL` | `setup/sync-skills.ps1` | URL del repo GitHub con le skill, es: `https://github.com/michele6fumagalli/professoressa-opencode.git` |
| 4 | `PLACEHOLDER_SCHOOL_NAME` | `config/AGENTS.md`, `config/agents/professoressa.md`, `config/skills/verbale-riunione/SKILL.md` | Nome della scuola, es: `Istituto Comprensivo "G. Pascoli"` |
| 5 | `PLACEHOLDER_TEACHER_NAME` | `config/AGENTS.md`, `config/agents/professoressa.md` | Nome della professoressa, es: `Maria` |
| 6 | `PLACEHOLDER_SCHOOL_VERBALE_TEMPLATE` | `config/skills/verbale-riunione/SKILL.md` | Se la scuola ha un modello verbale ufficiale diverso da quello generico, sostituire il template nel Passo 2 della skill. Se il modello generico va bene, rimuovere solo questa riga di nota. |
| 7 | `PLACEHOLDER_PDP_FORMAT` | `config/skills/adatta-verifica/SKILL.md` | Se la scuola ha un formato PDP/PEI specifico, descriverlo qui. Altrimenti sostituire con: `"Seguire le linee guida ministeriali standard (DM 2011)"` |
| 8 | `PLACEHOLDER_REFERENCE_DOCX` | `config/skills/salva-file/SKILL.md` | Opzionale: percorso a un file `reference.docx` con lo stile della scuola (font, intestazione, margini). Se non usato, rimuovere la riga di nota. |

---

## Setup in-person — checklist completa

Esegui questi passaggi nell'ordine indicato. Spunta ogni punto prima di passare al successivo.

### Prima della visita (da casa tua)

- [ ] Crea il repo GitHub: `github.com/new` → nome suggerito: `professoressa-opencode` (pubblico)
- [ ] Completa tutti i placeholder nella tabella sopra
- [ ] Verifica che `config/opencode.json` abbia i commenti corretti (il file usa JSONC)
- [ ] Fai un test locale se possibile

### Durante la visita

**1. Installa i prerequisiti**
```powershell
# Installa Git (necessario per il sync automatico)
winget install Git.Git

# Installa Pandoc (necessario per generare .docx)
winget install JohnMacFarlane.Pandoc

# Installa OpenCode
npm install -g opencode-ai
```

**2. Crea la cartella di output**
```powershell
New-Item -ItemType Directory -Path "C:\Users\PLACEHOLDER_WINDOWS_USERNAME\Desktop\Scuola" -Force
```

**3. Copia la config di OpenCode**
```powershell
# Crea la cartella config se non esiste
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config\opencode\agents" -Force
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config\opencode\skills" -Force

# Copia i file di configurazione
Copy-Item "config\AGENTS.md"      "$env:USERPROFILE\.config\opencode\AGENTS.md"
Copy-Item "config\opencode.json"  "$env:USERPROFILE\.config\opencode\opencode.json"
Copy-Item "config\agents\professoressa.md" "$env:USERPROFILE\.config\opencode\agents\professoressa.md"
```

**4. Clona le skill dal repo GitHub**
```powershell
git clone PLACEHOLDER_GITHUB_REPO_URL "$env:USERPROFILE\.config\opencode\skills"
```

**5. Copia lo script di sync e registra il task notturno**
```powershell
# Copia lo script
Copy-Item "setup\sync-skills.ps1" "$env:USERPROFILE\.config\opencode\sync-skills.ps1"

# Registra il Scheduled Task (esegui PowerShell come Amministratore)
$scriptPath = "$env:USERPROFILE\.config\opencode\sync-skills.ps1"
$action  = New-ScheduledTaskAction -Execute "PowerShell.exe" `
             -Argument "-NonInteractive -WindowStyle Hidden -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -Daily -At "02:00"
$settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -StartWhenAvailable
Register-ScheduledTask -TaskName "OpenCode-SyncSkills" `
                       -Action $action -Trigger $trigger -Settings $settings `
                       -RunLevel Highest -Force
```

**6. Configura OpenCode Zen**
```
# Apri OpenCode
opencode

# Dentro OpenCode, esegui:
/connect
# Seleziona "OpenCode Zen", vai su opencode.ai/auth, crea l'account, copia l'API key
# Incolla la chiave quando richiesto
```

**7. Test finale — esegui una prova di ogni funzione**
- [ ] Apri OpenCode → verifica che si presenti in italiano come "Ciao PLACEHOLDER_TEACHER_NAME!"
- [ ] Chiedi un verbale di prova → verifica che usi la skill `verbale-riunione`
- [ ] Chiedi di adattare una verifica di prova → verifica `adatta-verifica`
- [ ] Chiedi una ricerca su "metodologia CLIL" → verifica `ricerca-web` con fonti
- [ ] Chiedi di salvare un documento → verifica che Pandoc crei il .docx in `Desktop\Scuola`
- [ ] Verifica che il sync script giri: `Start-ScheduledTask -TaskName "OpenCode-SyncSkills"`
- [ ] Controlla il log: `Get-Content "$env:USERPROFILE\.config\opencode\sync-log.txt"`

---

## Come aggiornare le skill in futuro

Quando vuoi aggiornare o aggiungere skill:

```bash
# Sul tuo Mac, nella cartella del progetto:
# 1. Modifica i file in config/skills/
# 2. Commit e push al repo GitHub
git add .
git commit -m "[minor - aggiorna skill X]"
git push

# La notte stessa, il task notturno aggiorna automaticamente la macchina di mamma.
# Nessuna azione necessaria da parte sua.
```

Per forzare un aggiornamento immediato (da remoto via screen share):
```powershell
Start-ScheduledTask -TaskName "OpenCode-SyncSkills"
```

---

## Come pushare questo progetto su GitHub (repo separato)

Questo progetto vive localmente dentro `michele-ai/` ma va su un repo GitHub separato.

```bash
# 1. Crea il repo su GitHub: github.com/new
#    Nome suggerito: professoressa-opencode
#    Visibilità: pubblica (le skill non contengono dati sensibili)

# 2. Spostati nella cartella del progetto
cd /path/to/professoressa-project

# 3. Inizializza git (se non già fatto)
git init
git add .
git commit -m "[minor - initial setup: professoressa opencode config]"

# 4. Collega al repo remoto e fai il primo push
git remote add origin https://github.com/michele6fumagalli/professoressa-opencode.git
git branch -M main
git push -u origin main
```

Da qui in poi: `git add . && git commit -m "..." && git push` per ogni aggiornamento.

---

## Diagnostica rapida (da remoto via screen share)

```powershell
# Versione OpenCode installata
opencode --version

# Pandoc installato?
pandoc --version

# Git installato?
git --version

# Skill sincronizzate?
Get-ChildItem "$env:USERPROFILE\.config\opencode\skills"

# Log ultimo sync
Get-Content "$env:USERPROFILE\.config\opencode\sync-log.txt" -Tail 20

# Task notturno attivo?
Get-ScheduledTask -TaskName "OpenCode-SyncSkills" | Select-Object TaskName, State
```
