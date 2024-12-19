@react.component
let make = (~card, ~gridArea, ~isSelected) => {
  let {bgclass} = PCard.view(card)
  <div
    className={`${gridArea} ${bgclass} aspect-9/16 bg-contain rounded-lg  cursor-pointer select-none ` ++
    switch gridArea == "x99" {
    | true => "-rotate-70"
    | false => ""
    }}
  />
}
