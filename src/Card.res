@react.component
let make = (~card, ~gridArea, ~isSelected, ~children=?) => {
  let {bgClass} = PCard.view(card)
  <div
    className={`${gridArea} ${bgClass} bg-[percentage:5300%] aspect-9/16 rounded-lg cursor-pointer relative select-none ` ++
    switch gridArea == "s_8" {
    | true => "-rotate-70 "
    | false => ""
    } ++
    switch isSelected {
    | true => "shadow-card "
    | false => ""
    } ++
    switch bgClass == "" {
    | true => ""
    | false => "bg-[url(/cards.webp)]"
    }}>
    {switch children {
    | Some(el) => el
    | None => React.null
    }}
  </div>
}
