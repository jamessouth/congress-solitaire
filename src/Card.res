@react.component
let make = (~card, ~gridArea, ~isSelected) => {
  let {bgclass} = PCard.view(card)
  <div
    className={`${gridArea} ${bgclass} aspect-9/16 bg-contain rounded-lg  cursor-pointer relative select-none ` ++
    switch gridArea == "x99" {
    | true => "-rotate-70"
    | false => ""
    }}>
    {switch isSelected {
    | true =>
      <span
        className="text-4xl text-[#034f8c] absolute -translate-x-1/2 -translate-y-1/2 left-1/2 top-1/2">
        {React.string("✓")}
      </span>
    | false => React.null
    }}
  </div>
}
