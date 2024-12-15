module Node: {
  type t<'a>
}
type t<'a>
let make: unit => t<'a>
let isEmpty: t<'a> => bool
let push: (t<'a>, 'a) => unit
let pop: t<Null.t<'a>> => Null.t<'a>
let peek: t<Null.t<'a>> => Null.t<'a>
let getSize: t<'a> => int
