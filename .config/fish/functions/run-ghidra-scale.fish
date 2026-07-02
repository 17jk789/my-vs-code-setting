function run-ghidra-scale --description "Launch Ghidra (installed via yay) optimized for Hyprland/Wayland"

    if not type -q ghidra
        echo (set_color red)"Error: Ghidra is not installed on the system!"(set_color normal)
        echo "Please install it using: yay -S ghidra"
        return 1
    end

    ghidra >/dev/null 2>&1 &

    disown
end
