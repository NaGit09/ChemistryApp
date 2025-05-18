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
        try {
            const response = await axiosInstance.get(`/Chemiscals`);
            const chemicals = response.data.map((item: {
                id: number;
                name: string;
                atomic_weight: number;
                symbol: string;
                type_id: number;
                hazard_infor: string;
                status: string;
                description: string;
                image: string;
            }) => new Chemiscal(
                item.id,
                item.name,
                item.atomic_weight,
                item.symbol,
                item.type_id,
                item.hazard_infor,
                item.status,
                item.description,
                item.image,
            ));
            set({ chemicals });
            console.log(chemicals);
        } catch (error) {
            console.error('Failed to fetch chemicals:', error);
            set({ chemicals: [] }); // Clear chemicals on error
        }
    }
}))

export default useChemiscalStore;