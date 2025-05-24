import { Link } from "react-router-dom";
import logo from "@/assets/react.svg";
import useAuthStore from "@/store/authStore";
const Header = () => {
  const isAuthenticated = useAuthStore((state) => state.isAuthenticated);
  const logout = useAuthStore((state) => state.logout);
  return (
    <header className="bg-transparent text-Neutral h-16 py-4 px-4 flex items-center justify-between">
      <Link to="/">
        <img src={logo} alt="logo" className="w-12 h-12 rounded-full mr-2" />{" "}
      </Link>
      <nav className="flex justify-between items-center px-4">
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
          {!isAuthenticated ? (
            <>
              <li className="text-2xl font-bold hover:text-Lanthanide">
                <Link to="/login">Login</Link>
              </li>
              <li className="text-2xl font-bold hover:text-Lanthanide">
                <Link to="/register">Register</Link>
              </li>
            </>
          ) : (
            <button
              onClick={() => {
                logout();
                window.location.reload();
              }}
            >
              Logout
            </button>
          )}
        </ul>
      </nav>
    </header>
  );
};

export default Header;
