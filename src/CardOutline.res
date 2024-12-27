@react.component
let make = (~gridArea, ~cls, ~children=?, ~onClick=?) => {
  <div
    onClick={switch onClick {
    | Some(oc) => oc
    | None => _ => ()
    }}
    className={`${gridArea} ${cls} gw aspect-9/16 outline-cardBlack rounded-lg   `}>
    {switch children {
    | Some(el) => el
    | None => React.null
    }}
  </div>
}
