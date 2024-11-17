
(* demo.ml - Demonstrate the GrabBag data structure a bit
 *
 * This is a little funny looking because the GrabBag does not actually use
 * refs at all... it is quite pure. So we wrap the grabBag in a ref and then
 * have to de-reference it when calling GrabBag functions. It would be quite
 * easy to modify the GabBag itself to use refs... but what fun would that be?
 *
 * History / Notes
 *   2003.11.10 (rbw)
 *     - Created
 *)

type intBag = int GrabBag.t

let _ =
  (* Start up the random number generator *)
  Random.self_init();

  (* Create a bag *)
  print_string "Creating an int bag.\n";
  let b = ref GrabBag.empty in

  (* First lets add a few things *)
  print_string "Adding 10 items.\n";
  for i = 1 to 10 do
    let n = Random.int 100 in
    print_string "Adding ";
    print_int n;
    print_string ".\n";
    b := GrabBag.add !b n
  done;

  (* Okay, now lets pull them out one at a time... *)
  print_string "Okay, now lets pull them back out.\n";
  for i = 1 to 10 do
    let (n,b') = GrabBag.grab !b in
    b := b';
    print_string "Grabbed ";
    print_int n;
    print_string ".\n"
  done;

  print_string "Okay, all done!\n";
  print_newline()

