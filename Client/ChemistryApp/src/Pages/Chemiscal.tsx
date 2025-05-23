import { useEffect, useState } from "react";
import ChemiscalCard from "@/components/customs/ChemiscalCard";
import SearchFild from "@/components/customs/SearchFild";
import { Chemiscal as ChemiscalType } from "@/Types/Chemiscal";
import useChemiscalStore from "@/Store/chemiscalStore";
import Header from "@/components/customs/Header";

const Chemiscal = () => {
  // declare state
  const { chemicals, fetchChemicals } = useChemiscalStore();
  const [searchText, setSearchText] = useState("");
  const [filteredChemicals, setFilteredChemicals] = useState<ChemiscalType[]>(
    []
  );
  // Gọi API 1 lần khi component mounted
  // Gọi 1 lần khi component mount
  useEffect(() => {
    fetchChemicals();
  }, []);

  // Gọi mỗi khi searchText hoặc chemicals thay đổi
  useEffect(() => {
    const filtered = chemicals.filter((chemical) =>
      chemical.getName().toLowerCase().includes(searchText.toLowerCase())
    );
    setFilteredChemicals(filtered);
  }, [chemicals, searchText]);

  return (
    <div className="bg-DarkText">
      <Header/>
      <div className="w-full flex flex-col items-center h-screen gap-4 ">
      <SearchFild
        onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
          setSearchText(e.target.value)
        }
      />

      <div className="w-full flex flex-wrap gap-4 justify-center items-center bg-DarkText">
        {searchText !== ""
          ? filteredChemicals.map((chemical) => (
              <ChemiscalCard key={chemical.getId()} chemical={chemical} />
            ))
          : chemicals.map((chemical) => (
              <ChemiscalCard key={chemical.getId()} chemical={chemical} />
            ))}
      </div>
    </div>
    </div>
    
  );
};

export default Chemiscal;
