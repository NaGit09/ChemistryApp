import axiosInstance from "@/lib/AxiosInstance";
import { Experiment } from "@/types/Experiment";
import { create } from "zustand";
interface experimentInterface {
  Experiments: Experiment;
  fetchExperiments: (id1 : number , id2 : number) => void;
}
export const useExperimentStore = create<experimentInterface>((set) => ({
  Experiments: new Experiment(0, 0, 0, ""),
  fetchExperiments: async (id1 , id2) => {
    const response = await axiosInstance.get(`/Experiment/${id1}/${id2}`);
    const experiments = new Experiment(
        response.data.id,
        response.data.elemential1,
        response.data.elemential2,
        response.data.description
    );
    set({ Experiments: experiments });
  },
}));
