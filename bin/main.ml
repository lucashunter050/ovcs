(* init cli functionality*)

[@@@alert "-deprecated"] (* Silences an issue with Cmdliner.Term.info being deprecated*)


(* terminal command to be used to create a new OVCS repo*)
let init_cmd =
  let doc = "Initialize a new OVCS repository" in
  Cmdliner.Term.(const Init.init_repo, info "init" ~doc)

(* program entry point, evaluates command and executes appropriate function *)
let () =
  let cmds = [init_cmd] in
  let default_cmd = Cmdliner.Term.(ret (const (`Help (`Pager, None)))) in
  (* Evaluate the command or display help if no command is provided *)
  let result = Cmdliner.Term.eval_choice default_cmd cmds in
  Stdlib.exit result
