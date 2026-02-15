// ============================================
// AKADEMINIO REFERATO ŠABLONAS
// ============================================

// Puslapio nustatymai
#let setup-page() = {
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 2cm, top: 2cm, bottom: 2cm),
    numbering: "1",
    number-align: center,
  )
}

// Teksto nustatymai
#let setup-text() = {
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "lt",
  )
}

// Pastraipos nustatymai
#let setup-paragraph() = {
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 1.25cm,
  )
}

// Skyrių nustatymai
#let setup-headings() = {
  set heading(numbering: "1.1.")
  
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1cm)
    set text(size: 14pt, weight: "bold")
    block(it)
    v(0.5cm)
  }
  
  show heading.where(level: 2): it => {
    v(0.5cm)
    set text(size: 12pt, weight: "bold")
    block(it)
    v(0.3cm)
  }
}

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
  set page(margin: 2.5cm)
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
  setup-page()
  setup-text()
  setup-paragraph()
  setup-headings()
  show link: underline
  
  doc
}