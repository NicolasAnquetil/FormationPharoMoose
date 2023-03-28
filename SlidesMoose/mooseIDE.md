---
marp: true
title: MooseIDE -- plateforme interactive d'analyse logicielle
description: Moose Training
author: Nicolas Anquetil
---
<!-- headingDivider: 1 -->
<!-- paginate: true -->
<!-- footer: "MooseIDE -- Plateforme interactive d'analyse logicielle" -->

# MooseIDE

- Interface utilisateur de Moose
- Objectifs
  - Evolutive (ajout de nouveaux outils)
  - Polyglote (Méta-modèle composable Famix)
  - Tous niveaux ("novices" / experts)

# Architecture

- Basée sur Moose (Famix, Roassal, MooseQuery, Tagging) et Pharo (Spec)
- Ensemble de micro-outils collaborant entre eux
- Échangent des informations sur des bus de données
- Bus véhiculent des entités Famix

# Architecture

![Moose Architecture h:450](./Images/mooseArchi.png)

# Micro-Outils

![bg right:35% h:600](./Images/mooseMenu.png)

- Attachés a 0, 1, *n* bus
- Lisent et écrivent des entités sur leur(s) bus
- Ont chacun 1 tâche précise
  - *Model Browser* : création/import de modèles Famix
  - *Moose Query* : sélection d'entités dans une collection
  - *Entities exporter* : export CSV d'entités
  - ...

# Micro-Outils

![bg right:60% w:700](./Images/mooseToolHeader.png)
- Mode de réception
- Bus
- Tag
- Configuration
- Inspection
- Propagation

# Interaction avec les bus

- Mode de réception
  - *Follow* : traite "normalement" les entités reçues sur le bus
  - *Freeze* : ne lit pas sur le bus (mais peut écrire)
  - *Highlight* : met en exergue des nouvelles entités reçues dans le contexte des entités affichées précédemment
- "Bus: " : sélection/création de bus à suivre et sur le(s)-quel(s) écrire
- *Propagate* : Écrire les entités courantes de l'outil sur le(s) bus qu'il suit
- Note: Un outil peut n'être attaché à aucun bus (préservation d'un résultat obtenu, v. mode *Freeze*)