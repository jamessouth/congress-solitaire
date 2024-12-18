@react.component
let make = (~card, ~gridArea, ~isSelected) => {
  let {bgclass} = PCard.view(card)
  // place-items-center text-xl grid bg-zinc-100
  <div
    className={`${gridArea} ${bgclass} aspect-9/16 bg-contain rounded-lg  cursor-pointer select-none ` ++
    switch gridArea == "x99" {
    | true => "-rotate-70"
    | false => ""
    }}>
    // <p className={`row-start-2 row-end-3 col-start-2 col-end-3${valueFont}${valueColor}`}>
    //   {valueStr}
    // </p>
    // <p
    //   className={`row-start-6 row-end-7 col-start-4 col-end-5 rotate-180${valueFont}${valueColor}`}>
    //   {valueStr}
    // </p>
    // <p className="row-start-3 row-end-4 col-start-2 col-end-3"> {symbolStr} </p>
    // <p className="row-start-5 row-end-6 col-start-4 col-end-5 rotate-180 "> {symbolStr} </p>
    // <p className="row-start-4 row-end-5 col-start-3 col-end-4 text-6xl"> {symbolStr} </p>
  </div>
}
