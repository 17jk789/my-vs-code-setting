function create-c-pro --argument-names action name
    # Prüfen auf korrekte Argumente
    if test "$action" != "new"; or test -z "$name"
        echo "Usage: create-c-pro new <project-name>"
        return 1
    end

    set PROJECT_DIR (pwd)/$name

    if test -d "$PROJECT_DIR"
        echo "❌ Fehler: $PROJECT_DIR existiert schon!"
        return 1
    end

    # Struktur erstellen
    mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/include" "$PROJECT_DIR/build"
    cd "$PROJECT_DIR"

    # Beispiel main.c erstellen
    printf '#include <stdio.h>\n\nint main() {\n    printf("Hello C from Julian!\\n");\n    return 0;\n}\n' > src/main.c

    # CMakeLists.txt erstellen (für C konfiguriert)
    printf 'cmake_minimum_required(VERSION 3.10)
project(%s VERSION 1.0 LANGUAGES C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Die Binary heißt IMMER app
add_executable(app src/main.c)
target_include_directories(app PUBLIC include)' "$name" > CMakeLists.txt

    # Build initialisieren und kompilieren
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
    cmake --build build

    # Symbolischer Link für LSP (Clangd)
    ln -s build/compile_commands.json .

    # .clang-format erstellen
    printf "---\nLanguage: Cpp\nBasedOnStyle: Google\nIndentWidth: 4\nTabWidth: 4\nUseTab: Never\n..." > .clang-format

    echo ""
    echo "✅ C-Projekt '$name' bereit!"
    echo "Binary: $PROJECT_DIR/build/app"
end
