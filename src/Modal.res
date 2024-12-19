@react.component
let make = (~modalBGRand, ~setModalOpen) => {
  <>
    <div className="absolute h-full w-full opacity-50 bg-neutral-950 z-10" />
    <div
      className={`${modalBGRand} bg-contain bg-no-repeat aspect-9/16 absolute z-20 top-[10%] bottom-[10%] rounded-3xl p-2 text-cardBlack font-cutive text-sm flex flex-col justify-center`}>
      <button
        className="absolute top-[2%] right-[4%] text-xl"
        onClick={_ => {
          setModalOpen(_ => false)
        }}>
        {React.string("X")}
      </button>
      <p className="">
        {React.string(
          "aosi aiao; oiaj a a;oij aoj oij ao  oij;aoj f;aij;oaij ;fioi oai ;a faioaiu hoiuh goaiuh",
        )}
      </p>
    </div>
  </>
}
