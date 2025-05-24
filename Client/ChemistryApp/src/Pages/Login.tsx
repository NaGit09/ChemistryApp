import Header from "@/components/customs/Header";
import LoginForm from "../components/customs/LoginForm";
const Login = () => {
  return (
    <div className="bg-DarkText">
        <Header />
      <div className="flex flex-col items-center justify-center w-full h-screen text-white bg-DarkText">
        <div className="w-full max-w-md flex flex-col items-center justify-center border-2 shadow border-gray-200 rounded-lg  px-4 py-4">
          <h1 className="text-2xl font-bold">Login</h1>
          <LoginForm />
        </div>
      </div>
    </div>
  );
};

export default Login;
