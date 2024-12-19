@react.component
let make = (~modalBGRand, ~setModalOpen) => {
  <>
    <div className="absolute h-full w-full opacity-50 bg-neutral-950 z-10" />
    <div
      className={`${modalBGRand} bg-contain bg-no-repeat aspect-9/16 absolute z-20 top-[4%] bottom-[4%] rounded-[2.75rem] p-2 text-cardBlack font-cutive text-[2.25vh] flex flex-col justify-center`}>
      <button
        className="absolute top-[4%] right-[8%] text-[3.5vh]"
        onClick={_ => {
          setModalOpen(_ => false)
        }}>
        {React.string("X")}
      </button>
      <h2 className="font-bold mb-4 text-center">
        <span> {React.string("CONGRESS")} </span>
        {React.string(
          " is a solitaire game that uses two decks of cards. To win, build up suits from Ace to King on the foundations (the center columns).",
        )}
      </h2>
      <p className="text-center">
        {React.string(
          "Move Aces to a foundation to begin a stack. Build them up by suit to King. Build down in any suit on the tableau (outer columns). Cards may be moved among tableau stacks to free up spots. Deal additional cards and begin new tableau stacks from the discard pile.",
        )}
      </p>
    </div>
  </>
}
