@react.component
let make = (~cls, ~children=?) => {
  <div className={`${cls} aspect-5/7 outline-cardBlack rounded-lg   `}>
    {switch children {
    | Some(el) => el
    | None => React.null
    }}
  </div>
}
