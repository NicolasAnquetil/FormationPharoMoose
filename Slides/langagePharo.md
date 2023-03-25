---
marp: true
title: Le langage Pharo
description: Formation Pharo/Moose @ Berger-Levrault
author: Nicolas Anquetil
keywords: pharo, moose, famix
---
<!-- headingDivider: 1 -->
<!-- paginate: true -->
<!-- footer: "Pharo -- Le langage" -->

# Pharo -- Le langage

![bg right h:700](./Images/pharoSyntax.png)

- Simple et élégant
- Complètement Objet

# Le langage

6 mots réservés :
- `nil`
- `true`, `false`
- `self`
- `super`
- (`thisContext`)

# Le langage

- Pas d'instruction de boucle
- Pas d'instruction de test
- Pas d'expressions arithmétiques ou booléennes
- Pas d'opérateurs
- Tout est fait par **message**

# Le langage

- Instructions
  - Affectation : `variable := 5`
  - Retour de  méthode : `^ 42`
  - Envoi de message : `object aMethod.`
- Le point (`.`) comme *séparateur* d'instruction

# Le langage

- Variables
  - non typées statiquement
  - Doivent être déclarées
  - ex: `| x y autreVariable |`
- Par convention, CamelCase, jamais de underscore (`_`)

# Le langage

- Litéraux
  - Nombre : `42`, `3.14`, `2e25`
  - Chaîne de caractères : `'This is a String with ''quotes'' !'`
  - Symbole (chaîne de caractères unique) : `#aSymbol`, `#'More complex!'`
  - Caractères : `$a`, `$:`, `$'`, ...
- Commentaires : `"Il est important de commenter les classes et les méthodes"`


# Le langage

- Tableaux
  - Tableau de litéraux ("literal array") : `#( 1 $a Symbol )`
  - Tableaux

# Le langage

- Les blocs
  - Méthodes anonymes, "lambda" (en fait Closure)
  - Sans paramètres : `[ 'Hello' traceCr ]`
  - Avec paramètres : `[ :param | 'Hello ' trace. param traceCr ]`
  - Avec variales locales : `[ :param ||a x| 'Hello ' trace. param traceCr ]`

# Le langage

- Les blocs
  - Peuvent être passés en paramètre (très courant)
  - Peuvent être stocké dans des variables (plus rare)
- Exécution
  - Sans paramètres : `[ 'Hello' traceCr ] value`
  - Avec paramètres :
  ```
  [ :x :y |
    'somme=' trace.
    (x+y) asString traceCr ]
  value: 5 value: 37
  ```

# Le langage

- Les messages
  - Unaires : `100 factorial`, `Date today`, `#(1 2 3) average`
  - Binaires : `1 + 2`, `1 < 2`, `1@2`
  - Mots clés : `2 between: 10 and: 20` (méthode `between:and:`)
- Priorité dans l'ordre ci-dessus
- Note: `+`, `<=`, `~=` sont des méthodes pas des opérateurs

# Le langage

- If/Then/Else 
  - `(1 > 2) ifTrue: [ "bloc then" ] ifFalse: [ "bloc else" ]`
- Boucles
  - `10 timesRepeat: [:i | "corps de la boucle" ]`
  - `#(Chico Harpo Groucho Zeppo) do: [:marx | "corps de la boucle" ]`
  - `[ "test de fin" ] whileTrue: [ "corps de la boucle" ]`

# Le langage

![Postcard](https://upload.wikimedia.org/wikipedia/commons/a/a7/Pharo_syntax_postcard.svg)
