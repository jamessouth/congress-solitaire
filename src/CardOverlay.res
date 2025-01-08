@react.component
let make = (~cls, ~char) => {
  <div className={`${cls} w-full h-full text-center font-cutive rounded-lg `}>
    {React.string(char)}
  </div>
}
