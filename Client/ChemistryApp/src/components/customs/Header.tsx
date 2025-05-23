import { Link } from "react-router-dom";
import useAuthStore from "@/Store/authStore";
const Header = () => {
  const isAuthenticated = useAuthStore((state) => state.isAuthenticated);
  const logout = useAuthStore((state) => state.logout);
  return (
    <header className="bg-transparent text-Neutral w-full h-16 py-4">
      <nav className="flex justify-between w-screen items-center px-4">
        <ul className="flex items-center justify-evenly gap-4">
          <li className="text-2xl font-bold hover:text-Lanthanide">
            <Link to="/">Home</Link>
          </li>
          <li className="text-2xl font-bold hover:text-Lanthanide">
            <Link to="/chemiscal">Chemiscals</Link>
          </li>
          <li className="text-2xl font-bold hover:text-Lanthanide">
            <Link to="/experiment">Experiment</Link>
          </li>
        </ul>
      { !isAuthenticated ? (
          <ul className="flex items-center justify-evenly gap-4 ">
          <li className="text-2xl font-bold hover:text-Lanthanide">
            <Link to="/login">Login</Link>
          </li>
          <li className="text-2xl font-bold hover:text-Lanthanide">
            <Link to="/register">Register</Link>
          </li>
        </ul>) : (<button onClick={() => {
          logout();
          window.location.reload();
        }}>Logout</button>) }
      </nav>
    </header>
  );
};

export default Header;
