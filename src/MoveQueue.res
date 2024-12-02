type t = {
  mutable sourceCard: Null.t<PCard.t>,
  mutable destCard: Null.t<PCard.t>,
}
let make = () => {
  sourceCard: Null.null,
  destCard: Null.null,
}
let isEmpty = t => {
  switch (Null.toOption(t.sourceCard), Null.toOption(t.destCard)) {
  | (Some(_), Some(_)) | (Some(_), None) | (None, Some(_)) => false
  | (None, None) => true
  }
}

let addSourceCard = (t, card) => {
  switch isEmpty(t) {
  | true => {}

  //   t.sourceCard = card
  | false => ()
  }
}

// let isLegalSource = src => {
//   switch src {
//   | "_0"
//   | "_3"
//   | "_4"
//   | "_7"
//   | "_8"
//   | "_11"
//   | "_12"
//   | "_15"
//   | "discard" => true
//   | _ => false
//   }
// }

// let isLegalMove = dest => {
//     switch dest {
//         |"_0"
//         |"_3"
//         |"_4"
//         |"_7"
//         |"_8"
//         |"_11"
//         |"_12"
//         |"_15"
//         |"discard" => true
//         |_ => false
//     }
// }
