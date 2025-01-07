@react.component
let make = (
  ~startBtnColor,
  ~startBtnText,
  ~setModalOpen,
  ~htp,
  ~setStartBtnText,
  ~setStartBtnColor,
) => {
  <button
    className={`_stbtn pt-0.5 h-24 w-32 outline-dotted outline-2 rounded-xl place-self-center font-cutive text-2xl ${startBtnColor} `}
    onClick={_ => {
      switch startBtnText == htp {
      | true => setModalOpen(_ => true)
      | false => ()
      }
      setStartBtnText(_ => htp)
      setStartBtnColor(_ => "text-cardRed")
    }}>
    {React.string(startBtnText)}
  </button>
}
