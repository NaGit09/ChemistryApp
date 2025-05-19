import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
export const getTypesElemential = (type: number) => {
  switch (type) {
    case 1:
      return "rounded-br-lg"; // Bo tròn góc dưới bên phải
    case 2:
      return "clip-polygon"; // Hình polygon custom
    default:
      return "";
  }
};