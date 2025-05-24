import type { ReactNode } from "react"
import HomePage from '@/pages/HomePage'
import Experiment from '@/pages/Experiment'
import Chemiscal from '@/pages/Chemiscal'
import Login from '@/pages/Login'
import Register from '@/pages/Register'

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