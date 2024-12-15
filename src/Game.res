@react.component
let make = (~tableau, ~foundations, ~moveQueue) => {
  <>
    {React.array(
      Array.map(
        [
          "x0",
          "xx0",
          "xx1",
          "x1",
          "x2",
          "xx2",
          "xx3",
          "x3",
          "x4",
          "xx4",
          "xx5",
          "x5",
          "x6",
          "xx6",
          "xx7",
          "x7",
        ],
        gridArea => {
          switch String.startsWith(gridArea, "xx") {
          | true => <CardOutline key=gridArea cls={`${gridArea} solid`} />
          | false => <CardOutline key=gridArea cls={`${gridArea} dashed`} />
          }
        },
      ),
    )}
    {React.array(
      Array.mapWithIndex(tableau, (stack, i) => {
        let gridArea = "x" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) => <Card key=gridArea card cls=gridArea isSelected={moveQueue == gridArea} />
        | None => React.null
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(foundations, (card, i) => {
        let gridArea = "xx" ++ Int.toString(i)
        switch Null.toOption(card) {
        | Some(card) => <Card key=gridArea card cls=gridArea isSelected=false />
        | None => React.null
        }
      }),
    )}
  </>
}
