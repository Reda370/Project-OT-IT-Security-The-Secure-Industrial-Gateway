#!/usr/bin/env bash
# setup_fise2_p2.sh
# Initialise l'arborescence de base pour le projet "FISE2_P2 - Project OT/IT Security".
# Usage : ./setup_fise2_p2.sh

set -euo pipefail

ROOT_DIR="$(pwd)"

echo "Création de l'arborescence de dossiers dans : ${ROOT_DIR}"

mkdir -p configs/firewall/
mkdir -p configs/network/

mkdir -p src/it/
mkdir -p src/ot/
mkdir -p src/jump-host/

mkdir -p docs/diagrams/
mkdir -p docs/screenshots/
mkdir -p docs/reports/

mkdir -p logs/

# Crée un .gitignore adapté au projet
cat > .gitignore <<'EOF'
# System files
.DS_Store
Thumbs.db

# Logs / captures
logs/
*.pcap
*.pcapng

# Python
__pycache__/
*.py[cod]
venv/

# Virtual environments
.vscode/
.idea/

# Temp
*~
*.swp
*.tmp

# Keys / secrets
*.key
*.pem

# Misc
*.bak
*.orig
EOF

echo "Arborescence créée et .gitignore ajouté."
