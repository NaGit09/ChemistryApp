import { create } from "zustand";
import axiosInstance from "../lib/AxiosInstance";
import { User } from "../Types/Auth";
import toast from "react-hot-toast";
interface AuthStore {
  user: User | null;
  isAuthenticated: boolean;
  setUser: (user: User | null) => void;
  login: (email: string, password: string) => Promise<void>;
  logout: () => void;
}
const useAuthStore = create<AuthStore>((set) => ({
  user: null,
  isAuthenticated: false,
  setUser: (user: User | null) => set({ user }),
  login: async (email: string, password: string) => {
    try {
      const response = await axiosInstance.post("/User/login", {
        email,
        password_hash: password,
      });
      set({ user: response.data });
      set({ isAuthenticated: true });
      toast.success("Login successful");
    } catch (error) {
      console.log(error);
      toast.error("Login failed");
    }
  },
  logout: () => set({ user: null }),
}));

export default useAuthStore;
