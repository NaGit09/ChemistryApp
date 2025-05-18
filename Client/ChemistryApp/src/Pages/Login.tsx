import LoginForm from "../components/customs/LoginForm";
const Login = () => {
  return (
    <div className="flex flex-col items-center justify-center w-full h-screen 
    bg-Neutral">
      <div className="w-full max-w-md flex flex-col items-center justify-center border-2 shadow border-gray-200 rounded-lg  px-4 py-4">
      <h1 className="text-2xl font-bold">Login</h1>
      <LoginForm />
      </div>
    </div>
  );
};

export default Login;
