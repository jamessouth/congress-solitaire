@react.component
let make = (~cls, ~children=?, ~onClick=?) => {
  switch onClick {
  | Some(oc) =>
    <div onClick=oc className={`${cls} aspect-5/7 outline-cardBlack rounded-lg   `}>
      {switch children {
      | Some(el) => el
      | None => React.null
      }}
    </div>
  | None =>
    <div className={`${cls} aspect-5/7 outline-cardBlack rounded-lg   `}>
      {switch children {
      | Some(el) => el
      | None => React.null
      }}
    </div>
  }
}
