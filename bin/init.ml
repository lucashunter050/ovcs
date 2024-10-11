(* logic for init *)

(* Uses syscalls to make the specified directory with 755 permissions
  (755 = owner has RWX, all else have RX)
   Does nothing if directory already exists
*)
let create_dir_if_not_exists dir_name = 
  if not (Sys.file_exists dir_name) then Unix.mkdir dir_name 0o755
  else 
    Printf.printf "Directory %s already exists.\n" dir_name

(* takes no arguments and initializes an empty VCS repo
   objects_dir stores file objects
   refs_dir stores branch references
   head_file points to current branch, initialized by default to main
*)

let init_repo () =
  let vcs_dir = ".ovcs" in
  let objects_dir = Filename.concat vcs_dir "objects" in 
  let refs_dir = Filename.concat vcs_dir "refs" in 
  let head_file = Filename.concat vcs_dir "HEAD" in 

  (* make the directory *)
  create_dir_if_not_exists vcs_dir;

  (* make all subdirectories necessary for VCS tracking *)
  create_dir_if_not_exists objects_dir;
  create_dir_if_not_exists refs_dir;

  (* make the HEAD file and set default branch to 'main'*)
  if not (Sys.file_exists head_file) then 
    let oc = open_out head_file in 
      output_string oc "ref: refs/heads/main\n";
      close_out oc 
  else
    Printf.printf "HEAD already exists\n"; 

  Printf.printf "Initialized empty VCS repository in %s\n" vcs_dir