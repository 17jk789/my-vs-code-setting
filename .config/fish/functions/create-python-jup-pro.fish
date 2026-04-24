function create-python-pro --argument-names action name
    # Prüfen auf korrekte Argumente
    if test "$action" != "new"; or test -z "$name"
        echo "Usage: create-python-jup-pro new <projektname>"
        return 1
    end

    set PROJECT_NAME $name
    set PROJECT_DIR (pwd)/$PROJECT_NAME

    # Prüfen, ob Ordner existiert
    if test -d "$PROJECT_DIR"
        echo "❌ Fehler: Ordner $PROJECT_NAME existiert hier bereits!"
        return 1
    end

    # Struktur erstellen (src-Layout)
    mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests"
    cd "$PROJECT_DIR"

    # Virtuelle Umgebung (venv) erstellen
    python3 -m venv venv

    # Hauptdatei erstellen
    touch main.py

    # Virtuelle Umgebung in fish aktivieren
    source venv/bin/activate.fish

    # Python-Tools installieren
    pip install --upgrade pip
    pip install pynvim jupyter_client ipykernel pylatexenc jupytext nbformat nbconvert notebook bandit

    # Jupyter Kernel installieren
    python -m ipykernel install --user --name=pneovim --display-name "Python (P-NeoVim)"

    # Berechtigungen für Jupyter korrigieren (Pfade dynamisch über $USER)
    sudo chown -R $USER:$USER "$HOME/.local/share/jupyter"
    mkdir -p "$HOME/.local/share/jupyter/runtime"
    chmod -R 700 "$HOME/.local/share/jupyter/runtime"

    echo "✅ Projekt $PROJECT_NAME erstellt."
    echo "💡 Die virtuelle Umgebung ist aktiv. Nutze 'deactivate' zum Beenden."
end
