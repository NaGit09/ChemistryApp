import { Link } from "react-router";
import logo from "@/assets/Background.png";
import Header from "@/components/customs/Header";
const HomePage = () => {
  return (
    <div className=" h-screen relative">
      <div className="absolute top-0 left-0 w-full"><Header/></div>
      <img src={logo} alt="logo" className="w-full h-full object-cover" />
      <div className="absolute top-25 left-20">
        <h1 className="text-white text-6xl font-bold">CHEX</h1>
      </div>
      <div className="absolute bottom-25 right-30">
        <Link to="/login" className="bg-Secondary hover:bg-Primary text-white  px-4 py-2 rounded-md">
          Get Started
        </Link>
      </div>
    </div>
  )
}

export default HomePage