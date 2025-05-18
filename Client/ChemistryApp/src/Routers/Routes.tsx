import type { ReactNode } from "react"
import HomePage from '../Pages/HomePage'
import Experiment from '../Pages/Experiment'
import Chemiscal from '../Pages/Chemiscal'
import Login from '../Pages/Login'
import Register from '../Pages/Register'

const Routers: { path: string; page: ReactNode }[] = [
  {
    path : "/",
    page : <HomePage />
  },
  {
    path : "/experiment",
    page : <Experiment />
  },
  {
    path : "/chemiscal",
    page : <Chemiscal />
  },
  {
    path : "/login",
    page : <Login />
  },
  {
    path : "/register",
    page : <Register />
  },
  {
    path : "/Chemiscal",
    page : <Chemiscal />
  }
]

export default Routers