import { create } from "zustand";
import axiosInstance from "@/lib/AxiosInstance";
import { User } from "@/types/Auth";
import toast from "react-hot-toast";

interface AuthStore {
  user: User | null;
  isAuthenticated: boolean;
  setUser: (user: User | null) => void;
  login: (email: string, password: string) => Promise<void>;
  logout: () => void;
  register: (email: string , full_name: string , password: string) => Promise<void>;
}
const useAuthStore = create<AuthStore>(( set) => ({
  // define the initial state
  user: null,
  isAuthenticated: false,
  setUser: (user: User | null) => set({ user }),
  // register function
  register: async (email: string , full_name: string , password: string) => {
    try {
      const response = await axiosInstance.post("/User/register", {
        email,
        full_name,
        password_hash: password,
      });
      set({ user: response.data });
      set({ isAuthenticated: true });
      toast.success("Register successful");
    } catch (error) {
      toast.error(`Register failed ${error}`);
    }
  },
  // login function
  login: async (email: string, password: string) => {
    try {
      const response = await axiosInstance.post("/User/login", {
        email,
        password_hash: password,
      });
      set({ user: response.data, isAuthenticated: true }) // 👈 gộp 1 lần
      toast.success("Login successful");
    } catch (error) {
      toast.error(`Register failed ${error}`);
    }
  },
  // logout function
  logout: () => {
    set({ user: null })
    set({ isAuthenticated: false });
  },
}));

export default useAuthStore;
