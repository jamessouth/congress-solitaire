%%raw("import './css/index.css'")

let rand = Int.mod(Float.toInt(Math.random() *. 100.0), 52)

switch ReactDOM.querySelector("#root") {
| Some(domElement) =>
  ReactDOM.Client.createRoot(domElement)->ReactDOM.Client.Root.render(
    // <React.StrictMode>
    <App rand />,
    // </React.StrictMode>,
  )
| None => ()
}
