import axiosInstance from "@/lib/AxiosInstance";
import { Elemential } from "@/Types/Elemential";
import { create } from "zustand";
// define  interface for the store
interface elementialStore {
  elementials: Elemential[];
  setElementials: (elementials: Elemential[]) => void;
  fetchElementials: () => Promise<void>;
}
// create the store using zustand
export const useElementialStore = create<elementialStore>((set) => ({
  elementials: [],
  setElementials: (elementials: Elemential[]) => set({ elementials }),
  fetchElementials: async () => {
    const response = await axiosInstance.get("/Chemiscals/");
    const elementials = response.data.map(
      (item: Elemential) =>
        new Elemential(
          item.id,
          item.name,
          item.symbol,
          item.atomicNumber,
          item.atomic_weight,
          item.type_id
        )
    );
    set({ elementials });
  },
}));
