---
marp: true
title: Roassal
description: Formation Pharo/Moose @ Berger-Levrault
author: Soufyane Labsari
keywords: pharo, visualisation, roassal
---
<!-- headingDivider: 1 -->
<!-- paginate: true -->
<!-- footer: "Roassal 3" -->


# Roassal

![bg 100% right](images/systemcpx.png)



# Roassal

- Visualisation de données
- Un ensemble d'outils
- Dessiner des formes
- Disposer des formes
- Interactions avec les formes

#  Exemples 

# Roassal - Composants principaux
- **Canvas**
- **Shapes**
- **Layouts**
- **Events**
- **Interactions**

# Le canvas

- Contient et affiche les formes
```smalltalk
canvas := RSCanvas new.
canvas open
```
![bg auto right](images/rscanvasempty.png)

# Les formes
- Sous classes de `RSShape`
  - Rectangle : `RSBox`
  - Cercle : `RSCircle`
  - Ligne : `RSLine`
  - Texte : `RSLabel`
  - etc.

# Les formes
- Rectangle
```smalltalk 
rect := RSBox new.

```
![bg auto right](images/rsbox.png)

- Cercle
```smalltalk 
circle := RSCircle new.

```
![bg auto right](images/rscircle.png)

# Moduler les formes

Propriétés : `#height:`, `#width:`, `#color:`, `#border:`, `#borderColor:` 
```smalltalk 
rect height: 100;
     width: 50;
     color: Color red.
```
![bg auto right:30%](images/rsboxredmodified.png)


# Les formes
- Associer une donnée utilisateur (modèle) aux formes
  - Une forme peut représenter un object Pharo
  - Actions sur la forme en fonction de l'objet représenté
```smalltalk
shape model: 1
```

# Les formes dans le canvas
- Rectangle
```smalltalk 
canvas add: rect.
canvas add: circle.
canvas open
```
![bg 90% right](images/rscanvas.png)

# Application
Pour chaque classe de la hiérarchie de la classe `BLLazyServerPojo`, **collecter** un rectangle qui la décrit .
Le résultat doit être un ensemble de formes.
Ajouter ces formes dans un canvas et ouvrir le canvas.

# Les layouts
- Permettent de gérer la disposition des objets sur le canvas
  - Disposition horizontale `RSHorizontalLineLayout`
  - Disposition verticale `RSVerticalLineLayout`
  - Disposition arborescente `RSTreeLayout`
  - etc.


# Les layouts
- Disposition horizontale `RSHorizontalLineLayout`
```smalltalk
RSHorizontalLineLayout on: {circle, rect}.
canvas add: circle;
  add: rect.
canvas open
```

![bg 85% right:40%](images/horizontalLayout.png)

# Les liens
- Lier des formes
```smalltalk
line := RSLine new.
line from: rect;
  to: circle.
canvas add: line.
```

![bg 85% right:40%](images/rsline.png)

# Les liens
- Avec un point d'attache différent
```smalltalk
line := RSLine new.
line withBorderAttachPoint;
  from: rect;
  to: circle.
canvas add: line.
```

![bg 85% right:40%](images/rslineborder.png)

# Les liens
- Avec un builder
```smalltalk
RSLineBuilder line
  canvas: c;
  connectFrom: #aSelectorOnTheModel.
```

![bg 85% right:40%](images/rslineborder.png)

# Application
Créer des liens entre les classes et leur super classe.
Disposer les classe de façon à obtenir une arborescence.
![bg 85% right:40%](images/treeclasses.png)

# Les évènements

- Sous classes de RSEvent.
  - `RSMouseClick`, `RSMouseEnter`, `RSKeyDown`, etc.
```smalltalk
shape on: RSMouseClick do: [ :evt | "Action à réaliser" ]
```

# Les interactions

- Draggable `RSDraggable`
- Popup `RSPopup`
- Highlight `RSHighlightable`
- Menu `RSMenuActivable`

```smalltalk
shape @ RSPopup "Affiche le nom du modèle au passage de la souris"
```

# Application
Ajouter une interaction de votre choix sur les classes.
Ajouter un évènement sur chaque forme, permettant d'inspecter son modèle avec un clic droit.


# Quelques outils Roassal

- Normalizer
```smalltalk
RSNormalizer height
  shapes: c shapes;
  normalize: #numberOfMethods.
```
- Exporters (pdf, svg, png, ...)
```smalltalk
RSPNGExporter new
		canvas: self;
    filname: 'myCanvas';
    export
```

# Application
Modifier votre visualisation afin d'adapter la taille des classes en fonction de leurs propriétés :

- La hauteur : nombre de méthodes de la classe
- La largeur : nombre d'attributs de la classe
- La couleur : nombre de ligne de code

---
![bg 80% center](images/systemcpx.png)
---

# Ressources

- Github (MIT)
  - https://github.com/ObjectProfile/Roassal3
- Documentation
  - https://github.com/ObjectProfile/Roassal3Documentation:
- Agile Visualization
  - http://agilevisualization.com/