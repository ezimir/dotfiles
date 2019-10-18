#!/usr/bin/env python

import subprocess
import sys

GUAKE_PATH = "/usr/lib/python3/dist-packages/"

if __name__ == "__main__":
    sys.path.append(GUAKE_PATH)
    from guake import palettes
    names = {key.lower(): key for key in palettes.PALETTES.keys()}

    if len(sys.argv) == 1:
        print(' '.join([f'"{name}"' for name in names.values()]))

    else:
        selected = ' '.join(sys.argv[1:]).lower()
        selected = names[selected]
        palette = palettes.PALETTES[selected]
        commands = [
            ["dconf", "write", "/apps/guake/style/font/palette", f"'{palette}'"],
            ["dconf", "write", "/apps/guake/style/font/palette-name", f"'{selected}'"],
        ]
        for command in commands:
            subprocess.call(command)

