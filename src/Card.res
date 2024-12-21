@react.component
let make = (~card, ~gridArea, ~isSelected) => {
  let {bgclass} = PCard.view(card)
  <div
    className={`${gridArea} ${bgclass} aspect-9/16 bg-contain rounded-lg  cursor-pointer relative select-none ` ++
    switch gridArea == "s99" {
    | true => "-rotate-70 "
    | false => ""
    } ++
    switch isSelected {
    | true => "shadow-card"
    | false => ""
    }}
  />
}
