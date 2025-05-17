import './App.css'
import { Toaster } from 'react-hot-toast'
import MainLayout from './Layouts/MainLayout'
import LoginForm from './components/customs/LoginForm'
function App() {

  return (
     <>
     <Toaster position='top-right'/>
     <MainLayout>
      <h1>Hello world</h1>
      <LoginForm />
     </MainLayout>
     </>
      
  )
}

export default App
