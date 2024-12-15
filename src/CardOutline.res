@react.component
let make = (~cls, ~children=?, ~onClick=?) => {
  <div
    onClick={switch onClick {
    | Some(oc) => oc
    | None => ()
    }}
    className={`[grid-area:${cls}] aspect-5/7 outline-cardBlack rounded-lg   `}>
    {switch children {
    | Some(el) => el
    | None => React.null
    }}
  </div>
}
