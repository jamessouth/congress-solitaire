module Node = {
  type rec t<'a> = {
    data: 'a,
    next: Null.t<t<'a>>,
  }
}

type t<'a> = {mutable top: Null.t<Node.t<'a>>, mutable size: int}

let make = () => {
  top: Null.null,
  size: 0,
}

let isEmpty = t => t.top == Null.null

let push = (t, val) => {
  let newNode = {Node.data: val, next: t.top}
  t.top = Null.make(newNode)
  t.size = t.size + 1
}

let pop = t => {
  let temp = t.top
  t.top = switch Null.toOption(t.top) {
  | Some(n) => n.next
  | None => Null.null
  }
  t.size = t.size - 1
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

let getSize = t => t.size
