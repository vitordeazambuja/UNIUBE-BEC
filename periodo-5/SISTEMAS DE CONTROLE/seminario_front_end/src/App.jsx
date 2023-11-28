import {useState} from "react";
import './styles/app.css'

function App() {

  // Declaração de variáveis
  const [counter, setCounter] = useState(0)

  // Métodos
  const increase = () => {
    setCounter(count => count + 1)
  }

  const decrease = () => {
    if (counter > 0){
      setCounter(count => count -1)
    }
  }

  const reset = () => {
    setCounter(0)
  }

  return (
      <div className="App">
        <h1>SISTEMAS DE CONTROLE</h1>
        <p>AUTOMATIZAÇÃO DE PROCESSOS NO DESENVOLVIMENTO WEB FRONT-END</p>

        <h2 className="counter-title">Contador: {counter}</h2>

        <div className="btn_container">
          <button onClick={increase}>Aumentar</button>
          <button onClick={decrease}>Diminuir</button>
          <button onClick={reset}>Resetar</button>
        </div>

      </div>
  )
}

export default App
