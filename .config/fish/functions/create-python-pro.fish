function create-python-pro --argument-symbol action name
    # Prüfen auf korrekte Argumente
    if test "$action" != "new"; or test -z "$name"
        echo "Usage: create-python-pro new <projektname>"
        return 1
    end

    set PROJECT_DIR (pwd)/$name

    # Prüfen, ob Ordner existiert
    if test -d "$PROJECT_DIR"
        echo "❌ Fehler: Ordner $name existiert hier bereits!"
        return 1
    end

    # Struktur erstellen
    mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests"
    cd "$PROJECT_DIR"

    # Virtuelle Umgebung erstellen
    python3 -m venv venv

    # Hauptdatei erstellen
    touch main.py

    # In fish aktiviert man venv mit der .fish Datei
    source venv/bin/activate.fish

    # Python-Tools aktualisieren und installieren
    pip install --upgrade pip
    pip install bandit

    echo "✅ Projekt $name wurde erstellt!"
    echo "💡 Virtuelle Umgebung ist aktiv. (Deaktivieren mit 'deactivate')"
end
