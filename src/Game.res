@react.component
let make = (~tableau, ~foundations, ~moveQueue) => {
  <>
    {React.array(
      Array.map(
        [
          "b0",
          "d0",
          "d1",
          "b1",
          "b2",
          "d2",
          "d3",
          "b3",
          "b4",
          "d4",
          "d5",
          "b5",
          "b6",
          "d6",
          "d7",
          "b7",
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
        let gridArea = "b" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) => <Card key=gridArea card gridArea isSelected={moveQueue == gridArea} />
        | None => React.null
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(foundations, (card, i) => {
        let gridArea = "d" ++ Int.toString(i)
        switch Null.toOption(card) {
        | Some(card) => <Card key=gridArea card gridArea isSelected=false />
        | None => React.null
        }
      }),
    )}
  </>
}
