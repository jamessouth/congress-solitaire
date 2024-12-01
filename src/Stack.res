module Node = {
  type rec t<'a> = {
    data: 'a,
    next: Null.t<t<'a>>,
  }
}

type t<'a> = {mutable top: Null.t<Node.t<'a>>}

let make = () => {
  top: Null.null,
}

let isEmpty = t => t.top == Null.null

let push = (t, val) => {
  let newNode = {Node.data: val, next: t.top}
  t.top = Null.make(newNode)
}

let pop = t => {
  let temp = t.top
  t.top = switch Null.toOption(t.top) {
  | Some(n) => n.next
  | None => Null.null
  }
  switch Null.toOption(temp) {
  | Some(n) => n.data
  | None => Null.null
  }
}

let peek = t => {
  switch Null.toOption(t.top) {
  | Some(n) => n.data
  | None => Null.null
  }
}
