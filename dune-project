(lang dune 3.16)

(name ovcs)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Lucas Hunter")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name ovcs)
 (synopsis "Basic version control system written in OCaml")
 (description "A longer description")
 (depends ocaml dune unix cmdliner)
 (tags
  (version control, command line tools)
  ))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
