# FISE2_P2 - Project OT/IT Security : The Secure Industrial Gateway

![VirtualBox](https://img.shields.io/badge/VirtualBox-%235A5A5A.svg?logo=virtualbox&logoColor=white)
![Kali](https://img.shields.io/badge/Kali-%23004B8D.svg?logo=kali-linux&logoColor=white)
![Wireshark](https://img.shields.io/badge/Wireshark-%231A82D0.svg?logo=wireshark&logoColor=white)
![Python](https://img.shields.io/badge/Python-%233776AB.svg?logo=python&logoColor=white)

## 📌 Contexte
Projet académique de cybersécurité (FISE2 - Parcours 2) : créer une **DMZ industrielle sécurisée** (iDMZ) entre un réseau IT et un réseau OT simulé, puis détecter un mouvement latéral.

## 🎯 Objectif
Mettre en œuvre une segmentation stricte et une détection d’anomalies dans un environnement virtuel. Le démonstrateur doit prouver que :
- le trafic non autorisé est bloqué (politique « deny-by-default »)
- l’attaque latérale est détectée via analyse réseau (Wireshark / Snort)
- la preuve (captures / logs) est fournie pour un rapport de sécurité

---

## 🧩 Architecture cible
- **IT Zone** : VM Linux (Ubuntu / Kali) représentant le réseau bureautique
- **OT Zone** : VM simulant un PLC (Conpot ou script Python) écoutant Modbus/TCP (port 502)
- **Gateway** : VM firewall (pfSense / iptables) assurant l’iDMZ

---

## 🛠️ Phases du projet

### Phase 1 : Environment Setup
- Virtualisation : VirtualBox / VMware
- Déployer 3 VMs (IT, OT, Gateway)
- Préparer les réseaux virtuels (LAN IT, DMZ, OT)

### Phase 2 : Implémentation de l’“Air Gap”
1. Politique stricte : tout bloqué par défaut
2. Jump Host : seule machine autorisée à SSH depuis l’IT
3. OT Access : uniquement le Jump Host peut interroger l’OT via Modbus
4. Logging : journalisation complète des paquets rejetés

### Phase 3 : Attaque & Détection
1. **Scan interdit** : nmap depuis l’IT vers l’OT doit être bloqué et loggué
2. **Mouvement latéral** : attaque simulée du Jump Host vers l’OT (commande Modbus “malveillante”)
3. **Détection** : analyser avec Wireshark / Snort l’attaque Modbus « Write »
4. **Analyse** : extraire timestamp, IP source et commande observée

---

## 📂 Structure du dépôt
- `configs/` : configuration du firewall et du réseau
- `src/` : scripts d’attaque, simulation OT, automation
- `docs/` : diagrammes, captures d’écran, rapports
- `logs/` : captures Wireshark, journaux de pare-feu

---

## ▶️ Installez la structure initiale
```bash
cd "$(pwd)"  # ou chemin vers le dossier du projet
chmod +x setup_fise2_p2.sh
./setup_fise2_p2.sh
```

---

## ✅ Pour rendre le dépôt accessible sur GitHub (dès maintenant)
1) Crée un dépôt GitHub (ex. `FISE2_P2_OT-IT-Security`) sans README.
2) Dans le dossier local :
```bash
git init
git add .
git commit -m "Initial scaffold - FISE2 P2 OT/IT Security"
```
3) Ajoute le remote (remplace par ton URL) :
```bash
git remote add origin https://github.com/TON_UTILISATEUR/FISE2_P2_OT-IT-Security.git
```
4) Envoie sur GitHub :
```bash
git push -u origin main
```

---

## 🎓 Livraison attendue (Key Deliverable)
- Diagramme réseau segmenté
- Screenshots du scan nmap bloqué
- Capture Wireshark du Modbus malveillant
- Rapport d’incident (timestamp, IP source, commande)
