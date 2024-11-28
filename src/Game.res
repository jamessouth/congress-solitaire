@react.component
let make = (~arr) => {
  React.array(
    Array.mapWithIndex(arr, (card, i) => {
      <Card key={Int.toString(i)} card />
    }),
  )
}
