@react.component
let make = (~gameArea, ~moveQueue) => {
  <>
    {React.array(
      Array.map([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], i => {
        let iStr = "_" ++ Int.toString(i)
        let mult = 4 * (i / 4)
        switch i == mult || i == mult + 3 {
        | true => <CardOutline key={iStr} cls={`${iStr} dashed`} />
        | false => <CardOutline key={iStr} cls={`${iStr} solid`} />
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(gameArea, (stack, i) => {
        let iStr = "_" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) => <Card key={iStr} card cls=iStr isSelected={moveQueue == iStr} />
        | None => React.null
        }
      }),
    )}
  </>
}
