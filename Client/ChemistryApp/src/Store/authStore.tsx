import { create } from "zustand";
import axiosInstance from "@/lib/AxiosInstance";
import { IUser } from "@/Types/Auth";
import toast from "react-hot-toast";
interface AuthStore {
  user: IUser | null;
  isAuthenticated: boolean;
  setUser: (user: IUser | null) => void;
  login: (email: string, password: string) => Promise<void>;
  logout: () => void;
  register: (email: string , full_name: string , password: string) => Promise<void>;
}
const useAuthStore = create<AuthStore>(( set) => ({
  user: null,
  isAuthenticated: false,
  setUser: (user: IUser | null) => set({ user }),
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
      console.log(error);
      toast.error("Register failed");
    }
  },
  login: async (email: string, password: string) => {
    try {
      const response = await axiosInstance.post("/User/login", {
        email,
        password_hash: password,
      });
      set({ user: response.data, isAuthenticated: true }) // 👈 gộp 1 lần
      toast.success("Login successful");
    } catch (error) {
      console.log(error);
      toast.error("Login failed");
    }
  },
  logout: () => {
    set({ user: null })
    set({ isAuthenticated: false });
  },
}));

export default useAuthStore;
