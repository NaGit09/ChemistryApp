import { useEffect, useState } from "react";
import ChemiscalCard from "@/components/customs/ChemiscalCard";
import SearchFild from "@/components/customs/SearchFild";
import { Chemiscal as ChemiscalType } from "@/Types/Chemiscal";
import useChemiscalStore from "@/Store/chemiscalStore";

const Chemiscal = () => {
  // declare state
  const { chemicals, fetchChemicals } = useChemiscalStore();
  const [searchText, setSearchText] = useState("");
  const [filteredChemicals, setFilteredChemicals] = useState<ChemiscalType[]>([]);
  // Gọi API 1 lần khi component mounted
  fetchChemicals();
  // Gọi lọc mỗi khi searchText thay đổi
  useEffect(() => {
    const filtered = chemicals.filter((chemical) =>
      chemical.getName().toLowerCase().includes(searchText.toLowerCase())
    );
    setFilteredChemicals(filtered);
  }, [ searchText]);

  return (
    <div className="w-full flex flex-col items-center justify-start h-screen p-4 gap-4">
      <SearchFild
        onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
          setSearchText(e.target.value)
        }
      />

      <div className="w-full flex flex-wrap gap-4 justify-center items-center">
        { searchText !== "" ? filteredChemicals.map((chemical) => (
          <ChemiscalCard key={chemical.getId()} chemical={chemical} />
        )) : chemicals.map((chemical) => (
          <ChemiscalCard key={chemical.getId()} chemical={chemical} />
        ))}
      </div>
    </div>
  );
};

export default Chemiscal;
