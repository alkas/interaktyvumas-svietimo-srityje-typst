// ============================================
// AKADEMINIO REFERATO ŠABLONAS
// ============================================

// Titulinis puslapis
#let title-page(
  university: "",
  faculty: "",
  department: none,
  title: "",
  work-type: "Referatas",
  author: "",
  student-id: none,
  group: none,
  supervisor: none,
  city: "Vilnius",
  year: "2024",
) = {
  set page(margin: 2.5cm, numbering: none)
  set align(center)
  
  text(size: 14pt, weight: "bold")[
    #upper(university)
  ]
  
  v(0.3cm)
  
  text(size: 12pt, weight: "bold")[
    #upper(faculty)
  ]
  
  if department != none {
    v(0.2cm)
    text(size: 11pt)[#department]
  }
  
  v(1fr)
  
  text(size: 16pt, weight: "bold")[
    #title
  ]
  
  v(0.5cm)
  
  text(size: 12pt)[
    #work-type
  ]
  
  v(1fr)
  
  align(right)[
    #grid(
      columns: (auto, auto),
      column-gutter: 1em,
      row-gutter: 0.5em,
      align: (right, left),
      
      [Atliko:], [#author],
      ..if student-id != none {
        ([Stud. Nr.:], [#student-id])
      } else { () },
      ..if group != none {
        ([Grupė:], [#group])
      } else { () },
      ..if supervisor != none {
        ([], [],
         [Vadovas:], [#supervisor])
      } else { () },
    )
  ]
  
  v(1fr)
  
  text(size: 12pt)[
    #city, #year
  ]
  
  pagebreak()
}

// Citavimo funkcijos
#let cite-inline(author, year, page: none) = {
  if page != none {
    [(#author, #year, p. #page)]
  } else {
    [(#author, #year)]
  }
}

#let blockquote(content) = {
  set par(first-line-indent: 0cm)
  block(
    inset: (left: 1.25cm, right: 1.25cm),
    spacing: 0.65em,
  )[
    #set text(size: 11pt)
    #content
  ]
}

// Pagrindinė funkcija - pritaiko visus nustatymus
#let apply-template(doc) = {
  // 1. Puslapio nustatymai
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 1cm, top: 2cm, bottom: 2cm),
    numbering: "1",
    number-align: top + center,
  )
  
  // 2. Teksto nustatymai
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "lt",
  )

  // 3. Pastraipos nustatymai
  set par(
    // Teksto lygiuotė – abipusė
    justify: true,
    // Tarpai tarp eilučių – 1,5 eilutės
    leading: 1.2em,
    // Pastraipų pirmosios eilutės atitraukiamos 0,7 cm
    first-line-indent: (amount: 0.7cm, all: true),
  )

  set enum(indent: 0.7cm) // Numeruotiems sąrašams (1., 2., 3...)
  set list(indent: 0.7cm) // Nenumeruotiems sąrašams su taškeliais

  // 4. Skyrių nustatymai
  set heading(numbering: "1.1.")
  show heading.where(level: 1): it => {
    // Kiekvienas skyrius pradedamas rašyti naujame lape
    pagebreak(weak: true)
    // Skyriai rašomi centre
    set align(center)
    //v(1cm)
    // Skyrių pavadinimai rašomi paryškintomis raidėmis, dydis 14 pt
    set text(size: 14pt, weight: "bold")
    // Pavadinimai rašomi didžiosiomis raidėmis
    upper(it)
    // Po skyriaus pavadinimo būtina palikti 12 pt intervalą
    v(24pt, weak: true)
  }
  
  // 2 Lygis (Poskyriai)
  show heading.where(level: 2): it => {
    // Prieš poskyrį paliekamas 24 pt tarpas
    v(24pt, weak: true)
    // Poskyrių pavadinimai: paryškintas, 12 pt
    set text(size: 12pt, weight: "bold")
    pad(left: 0.7cm)[#it]
    // Po poskyrio pavadinimo paliekamas 12 pt intervalas
    v(12pt, weak: true)
  }

  // 3 Lygis (Skyreliai)
  show heading.where(level: 3): it => {
    // Prieš skyrelį paliekamas 24 pt tarpas
    v(24pt, weak: true)
    // Skyreliai lygiuojami prie kairiojo krašto
    set align(left)
    // Paryškintas, 12 pt, pasvirasis šriftas (italic)
    set text(size: 12pt, weight: "bold", style: "italic")
    // Atitraukiama 0,7 cm nuo kairiojo krašto
    pad(left: 0.7cm)[#it]
    // Po skyrelio pavadinimo paliekamas 12 pt intervalas
    v(12pt, weak: true)
  }
  
  show link: underline
  
  doc
}