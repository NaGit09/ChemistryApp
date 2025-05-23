import { create } from "zustand";
import { Chemiscal } from "@/Types/Chemiscal";
import axiosInstance from "@/lib/AxiosInstance";
interface ChemiscalStore {
  chemicals: Chemiscal[];
  setChemicals: (chemicals: Chemiscal[]) => void;
  fetchChemicals: () => Promise<void>;
}
const useChemiscalStore = create<ChemiscalStore>((set) => ({
  chemicals: [],
  setChemicals: (chemicals: Chemiscal[]) => set({ chemicals }),
  fetchChemicals: async () => {
    await axiosInstance
      .get(`/Chemiscals/`)
      .then((res) => {
        const chemicals = res.data.map(
          (item: Chemiscal) =>
            new Chemiscal(
              item.id,
              item.name,
              item.atomic_weight,
              item.symbol,
              item.type_id,
              item.hazard_infor,
              item.status,
              item.description,
              item.image
            )
        );
        set({ chemicals });
      })
      .catch((error) => {
        console.error("Failed to fetch chemicals:", error);
        set({ chemicals: [] }); // Clear chemicals on error
      });
  },
}));

export default useChemiscalStore;
