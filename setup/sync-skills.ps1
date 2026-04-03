# sync-skills.ps1
# Sincronizza le skill di OpenCode dal repository GitHub di Michele.
# Questo script viene eseguito automaticamente ogni notte come Scheduled Task.
# Non richiede alcuna azione dalla professoressa.
#
# PLACEHOLDER_2: Sostituire PLACEHOLDER_GITHUB_REPO_URL con l'URL reale del repo
# PLACEHOLDER_1: Sostituire PLACEHOLDER_WINDOWS_USERNAME con il nome utente Windows reale

# ============================================================
# CONFIGURAZIONE — modifica questi valori durante il setup
# ============================================================

$GitHubRepoUrl  = "PLACEHOLDER_GITHUB_REPO_URL"
# Esempio: "https://github.com/michele6fumagalli/professoressa-opencode.git"

$SkillsFolder   = "C:\Users\PLACEHOLDER_WINDOWS_USERNAME\.config\opencode\skills"
# Esempio: "C:\Users\maria\.config\opencode\skills"

$LogFile        = "C:\Users\PLACEHOLDER_WINDOWS_USERNAME\.config\opencode\sync-log.txt"
# Dove vengono registrati gli aggiornamenti (utile per diagnostica remota)

# ============================================================
# FUNZIONE DI LOG
# ============================================================

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "[$timestamp] $Message"
    Add-Content -Path $LogFile -Value $entry
}

# ============================================================
# INIZIO SCRIPT
# ============================================================

Write-Log "=== Inizio sincronizzazione skill ==="

# Verifica che git sia installato
try {
    $gitVersion = git --version 2>&1
    Write-Log "Git trovato: $gitVersion"
} catch {
    Write-Log "ERRORE: Git non e' installato. Installa Git da https://git-scm.com"
    exit 1
}

# Verifica che l'URL del repo sia stato configurato
if ($GitHubRepoUrl -eq "PLACEHOLDER_GITHUB_REPO_URL") {
    Write-Log "ERRORE: URL del repository GitHub non configurato. Modifica sync-skills.ps1."
    exit 1
}

# Controlla se la cartella skills esiste e contiene un repo git
if (Test-Path "$SkillsFolder\.git") {
    # La cartella esiste gia' come repo git — esegui pull
    Write-Log "Cartella skills trovata. Eseguo git pull..."
    try {
        $result = git -C $SkillsFolder pull origin main 2>&1
        Write-Log "git pull completato: $result"
    } catch {
        Write-Log "ERRORE durante git pull: $_"
        exit 1
    }
} elseif (Test-Path $SkillsFolder) {
    # La cartella esiste ma non e' un repo git
    Write-Log "ATTENZIONE: La cartella skills esiste ma non e' un repository git."
    Write-Log "Eseguo git init e collego al repository remoto..."
    try {
        git -C $SkillsFolder init 2>&1 | Out-Null
        git -C $SkillsFolder remote add origin $GitHubRepoUrl 2>&1 | Out-Null
        git -C $SkillsFolder pull origin main 2>&1
        Write-Log "Collegamento al repository completato."
    } catch {
        Write-Log "ERRORE durante il collegamento al repository: $_"
        exit 1
    }
} else {
    # La cartella non esiste — clona il repository
    Write-Log "Cartella skills non trovata. Eseguo git clone..."
    try {
        # Crea la cartella padre se non esiste
        $parentFolder = Split-Path $SkillsFolder -Parent
        if (-not (Test-Path $parentFolder)) {
            New-Item -ItemType Directory -Path $parentFolder -Force | Out-Null
        }
        git clone $GitHubRepoUrl $SkillsFolder 2>&1
        Write-Log "git clone completato."
    } catch {
        Write-Log "ERRORE durante git clone: $_"
        exit 1
    }
}

Write-Log "=== Sincronizzazione completata con successo ==="

# ============================================================
# ISTRUZIONI PER IL SETUP DELLO SCHEDULED TASK (da eseguire una volta sola)
# ============================================================
#
# Esegui questo comando in PowerShell come Amministratore per registrare
# il task che fa girare questo script ogni notte alle 02:00:
#
#   $action  = New-ScheduledTaskAction -Execute "PowerShell.exe" `
#                -Argument "-NonInteractive -WindowStyle Hidden -File `"$SkillsFolder\..\..\sync-skills.ps1`""
#   $trigger = New-ScheduledTaskTrigger -Daily -At "02:00"
#   $settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -StartWhenAvailable
#   Register-ScheduledTask -TaskName "OpenCode-SyncSkills" `
#                          -Action $action -Trigger $trigger -Settings $settings `
#                          -RunLevel Highest -Force
#
# Per verificare che il task sia registrato:
#   Get-ScheduledTask -TaskName "OpenCode-SyncSkills"
#
# Per eseguire il task manualmente (test):
#   Start-ScheduledTask -TaskName "OpenCode-SyncSkills"
#
# Per vedere il log di sincronizzazione:
#   Get-Content "C:\Users\PLACEHOLDER_WINDOWS_USERNAME\.config\opencode\sync-log.txt"
# ============================================================
