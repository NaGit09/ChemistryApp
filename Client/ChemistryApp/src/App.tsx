import "./App.css";
import { Toaster } from "react-hot-toast";
import Routers from "./Routers/Routes";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
function App() {
  return (
    <>
      <Router>
        <Routes>
          {Routers.map((route) => (
            <Route path={route.path} element={route.page} />
          ))}
        </Routes>
      </Router>
      <Toaster position="top-right" />
    </>
  );
}

export default App;
