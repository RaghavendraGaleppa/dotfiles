function vdn --description 'Open daily note and BS.md in vertical split from Notes root'
    # 1. Define the root directory
    set NOTE_ROOT "/home/raghavendragaleppa/Desktop/Notes2026"
    
    # 2. Change directory to root (helps with Vim tree view)
    cd $NOTE_ROOT

    # 3. Define relative paths for logic
    set DAILY_DIR "DailyNotes"
    set TEMPLATE "$DAILY_DIR/Template.md"
    set STATIC_FILE "$DAILY_DIR/BS.md"
    
    # 4. Get current Date components
    set MONTH_FOLDER (date +%B%Y)
    set FILE_NAME (date +%d%b%Y).md
    set TARGET_DIR "$DAILY_DIR/$MONTH_FOLDER"
    set TARGET_FILE "$TARGET_DIR/$FILE_NAME"

    # 5. Create month directory if it doesn't exist
    if not test -d "$TARGET_DIR"
        mkdir -p "$TARGET_DIR"
    end

    # 6. If daily file doesn't exist, copy from template
    if not test -f "$TARGET_FILE"
        if test -f "$TEMPLATE"
            cp "$TEMPLATE" "$TARGET_FILE"
            echo "Created new note from template: $FILE_NAME"
        else
            touch "$TARGET_FILE"
        end
    end

    # 7. Open both files in vertical split
    # Using relative paths so Vim tree shows Notes2026 as the root
    vim -O "$TARGET_FILE" "$STATIC_FILE"
end
