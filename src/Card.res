@react.component
let make = (~card, ~gridArea, ~isSelected, ~bg) => {
  let {bgclass} = PCard.view(card)
  <div
    className={`${gridArea} ${bgclass} ${bg} aspect-9/16 rounded-lg  cursor-pointer relative select-none ` ++
    switch gridArea == "s0" {
    | true => "-rotate-70 "
    | false => ""
    } ++
    switch isSelected {
    | true => "shadow-card"
    | false => ""
    }}
  />
}
