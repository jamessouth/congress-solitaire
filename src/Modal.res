@react.component
let make = (~setModalOpen, ~modalClass) => {
  <>
    <div className="absolute h-full w-full opacity-50 bg-cardBlack z-10" />
    <div
      className={`${modalClass} bg-[url(/cards.webp)] bg-[percentage:5300%] aspect-9/16 absolute z-20 top-[2%] bottom-[2%] rounded-[7vh]`}>
      <div
        className="bg-gradient-to-b from-cardWhite/50 via-cardWhite/90 to-cardWhite/50 h-full rounded-[7vh] p-4 text-cardBlack font-cutive text-[2.25vh] flex flex-col justify-center">
        <button
          className="absolute top-[4%] right-[8%] text-[3.5vh]"
          onClick={_ => {
            setModalOpen(_ => false)
          }}>
          {React.string("X")}
        </button>
        <p className={"font-bold mb-4 text-center leading-relaxed"}>
          {React.string(
            "CONGRESS is a solitaire game that uses two decks of cards. To win, build up suits from ace to king on the foundations (the center columns).",
          )}
        </p>
        <p className="text-center leading-relaxed">
          {React.string(
            "Move aces to a foundation to begin a stack. Build up by suit to king. Build down in any suit on the tableau (outer columns). Move cards among tableau stacks to free up spots (cards will glow ",
          )}
          <span className="text-cardRed"> {React.string("RED")} </span>
          {React.string(
            " when selected). Begin new tableau stacks with cards from the discard pile.",
          )}
        </p>
        <div
          className="text-blue-700 text-[3vh] w-3/5 absolute bottom-8 left-1/2 transform -translate-x-1/2 flex justify-between">
          <a
            className="hover:underline"
            rel="noopener noreferrer"
            target="_blank"
            href="https://github.com/jamessouth/congress-solitaire">
            {React.string("About")}
          </a>
          <a
            className="hover:underline"
            rel="noopener noreferrer"
            target="_blank"
            href="https://www.youtube.com/watch?v=HAadm5jjig0">
            {React.string("Video")}
          </a>
        </div>
      </div>
    </div>
  </>
}
