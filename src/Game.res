let winningScore = 104
@react.component
let make = (~tableau, ~foundations, ~moveQueue: Reducer.queueData, ~onGameClick, ~score) => {
  <div className="aspect-9/16 h-full grid gap-2 pt-1" onClick={e => onGameClick(e)}>
    {React.array(
      Array.map(
        [
          "sd0",
          "_d0",
          "_d1",
          "sd1",
          "sd2",
          "_d2",
          "_d3",
          "sd3",
          "sd4",
          "_d4",
          "_d5",
          "sd5",
          "sd6",
          "_d6",
          "_d7",
          "sd7",
        ],
        gridArea =>
          <CardOutline
            key=gridArea
            gridArea
            cls={switch String.startsWith(gridArea, "_d") {
            | true => "outline"
            | false => "outline-dashed"
            }}>
            {switch score == winningScore {
            | true =>
              switch gridArea {
              | "sd0" =>
                <CardOverlay
                  key=gridArea
                  cls="animate-[blink_2.75s_.4s_ease-in-out_infinite] text-cardBlack leading-[2.5] text-[11vh]"
                  char="Y"
                />
              | "sd1" =>
                <CardOverlay
                  key=gridArea
                  cls="animate-[blink_2.75s_1.6s_ease-in-out_infinite] text-cardBlack leading-[2.5] text-[11vh]"
                  char="W"
                />
              | "sd2" =>
                <CardOverlay
                  key=gridArea
                  cls="animate-[blink_2.75s_.8s_ease-in-out_infinite] text-cardBlack leading-[2.5] text-[11vh]"
                  char="O"
                />
              | "sd3" =>
                <CardOverlay
                  key=gridArea
                  cls="animate-[blink_2.75s_2s_ease-in-out_infinite] text-cardBlack leading-[2.5] text-[11vh]"
                  char="I"
                />
              | "sd4" =>
                <CardOverlay
                  key=gridArea
                  cls="animate-[blink_2.75s_1.2s_ease-in-out_infinite] text-cardBlack leading-[2.5] text-[11vh]"
                  char="U"
                />
              | "sd5" =>
                <CardOverlay
                  key=gridArea
                  cls="animate-[blink_2.75s_2.4s_ease-in-out_infinite] text-cardBlack leading-[2.5] text-[11vh]"
                  char="N"
                />
              | _ => React.null
              }
            | false => React.null
            }}
          </CardOutline>,
      ),
    )}
    {React.array(
      Array.mapWithIndex(tableau, (stack, i) => {
        let gridArea = "sd" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) =>
          <Card key=gridArea card gridArea isSelected={moveQueue.sourceCell == gridArea}>
            <span
              className={"absolute rounded-full h-5 w-5 leading-6 bg-cardWhite top-1/2 text-center font-cutive text-sm text-cardBlack " ++
              switch Int.mod(i, 2) == 0 {
              | true => "-left-[22px]"
              | false => "-right-[22px]"
              }}>
              {React.string(`${Int.toString(Stack.getSize(stack))}`)}
            </span>
          </Card>
        | None => React.null
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(foundations, (card, i) => {
        let gridArea = "_d" ++ Int.toString(i)
        <Card key=gridArea card gridArea isSelected=false>
          {switch PCard.view(card).rank == King {
          | true =>
            <CardOverlay
              cls="bg-cardBlack/70 text-cardWhite/70 mix-blend-hard-light text-[15vh]" char="✓"
            />
          | false => React.null
          }}
        </Card>
      }),
    )}
  </div>
}
