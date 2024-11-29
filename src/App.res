@react.component
let make = () => {
  <main className="h-full flex justify-around">
    <div className=" aspect-5/7 h-full grid gap-2 py-1">
      <Game arr=PCard.pCards />
    </div>
    <div className="grid h-full ">
      <CardOutline cls={"dotted a"} />
      <div className="b " />
      <CardOutline cls={"dotted c"} />
    </div>
  </main>
}
