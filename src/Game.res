@react.component
let make = (~tableau) => {
  <>
    {React.array(
      Array.map([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], i => {
        let iStr = "_" ++ Int.toString(i)
        let mult = 4 * (i / 4)
        switch i == 0 + mult || i == 3 + mult {
        | true => <CardOutline key={iStr} cls={`dashed ${iStr}`} />
        | false => <CardOutline key={iStr} cls={`solid ${iStr}`} />
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(tableau, (stack, i) => {
        let iStr = "_" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(top) => <Card key={iStr} card=top cls=iStr />
        | None => React.null
        }
      }),
    )}
  </>
}
