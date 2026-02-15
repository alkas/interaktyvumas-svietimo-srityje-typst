// ============================================
// PAGRINDINIS FAILAS - main.typ
// ============================================

// Importuojame šabloną
#import "template.typ": *

// Pritaikome formatavimą
#show: apply-template

// ============================================
// PRIEKINĖ DALIS (Front Matter)
// ============================================

#include "front-matter/title-page.typ"

// Turinys
#outline(
  title: "Turinys",
  indent: auto,
)
#pagebreak()

// Paveikslėlių sąrašas (jei reikia)
#outline(
  title: "Paveikslėlių sąrašas",
  target: figure.where(kind: image),
)
#pagebreak()

// Lentelių sąrašas (jei reikia)
#outline(
  title: "Lentelių sąrašas",
  target: figure.where(kind: table),
)
#pagebreak()

#include "front-matter/abstract.typ"

// ============================================
// PAGRINDINĖ DALIS (Main Body)
// ============================================

#include "chapters/01-ivadas.typ"

#include "chapters/02-interaktyvumo-samprata.typ"

#include "chapters/03-istorine-raida.typ"

#include "chapters/04-interaktyvios-technologijos.typ"

#include "chapters/05-pedagogines-teorijos.typ"

#include "chapters/06-praktiniai-pavyzdziai.typ"

#include "chapters/07-issukiai.typ"

#include "chapters/08-ateities-tendencijos.typ"

#include "chapters/09-isvados.typ "
// ============================================
// GALINĖ DALIS (Back Matter)
// ============================================

#include "back-matter/references.typ"

// Arba naudokite .bib failą:
// #bibliography("references.bib", style: "apa", title: "Literatūros sąrašas")

// Priedai (jei reikia)
// #include "back-matter/appendices.typ"