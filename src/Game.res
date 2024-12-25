@react.component
let make = (~tableau, ~foundations, ~moveQueue, ~bg) => {
  <>
    {React.array(
      Array.map(
        [
          "x0",
          "d0",
          "d1",
          "x1",
          "x2",
          "d2",
          "d3",
          "x3",
          "x4",
          "d4",
          "d5",
          "x5",
          "x6",
          "d6",
          "d7",
          "x7",
        ],
        gridArea =>
          <CardOutline
            key=gridArea
            gridArea
            cls={switch String.startsWith(gridArea, "d") {
            | true => "solid"
            | false => "dashed"
            }}
          />,
      ),
    )}
    {React.array(
      Array.mapWithIndex(tableau, (stack, i) => {
        let gridArea = "x" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) => <Card key=gridArea card gridArea isSelected={moveQueue == gridArea} bg />
        | None => React.null
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(foundations, (card, i) => {
        let gridArea = "d" ++ Int.toString(i)
        switch Null.toOption(card) {
        | Some(card) => <Card key=gridArea card gridArea isSelected=false bg />
        | None => React.null
        }
      }),
    )}
  </>
}
