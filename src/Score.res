@react.component
let make = (~score) => {
  <div className="_score text-cardBlack text-xl font-cutive text-center max-h-fit">
    {React.string("Score: " ++ Int.toString(score))}
  </div>
}
