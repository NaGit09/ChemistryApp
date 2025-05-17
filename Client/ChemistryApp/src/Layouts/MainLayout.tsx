import type { ReactNode } from "react";
type props = { children: ReactNode };
const MainLayout = ({ children }: props) => {
  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <div className="flex flex-col items-center justify-center w-full h-full">
        {children}
      </div>
    </div>
  );
};

export default MainLayout;
