import { useState } from "react";
import EyeOnSVG from "../../assets/eye-svgrepo-com.svg";
import EyeOffSVG from "../../assets/eye-slash-svgrepo-com.svg";
interface PasswordInputProps {
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
}

export default function PasswordInput({
  value,
  onChange,
  placeholder = "Enter your password",
}: PasswordInputProps) {
  const [show, setShow] = useState(false);


  return (
    <div className="relative w-full">
      <input
        type={show ? "text" : "password"}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="w-full border px-4 py-2 pr-10 rounded focus:outline-none focus:ring focus:border-blue-400"
      />
      <button
        type="button"
        className="absolute right-2 top-2.5 text-gray-500"
        onClick={() => setShow((prev) => !prev)}
        >
          {show ? <img src={EyeOffSVG} className="w-5 h-5" alt="EyeOffSVG" /> : <img src={EyeOnSVG} className="w-5 h-5"  alt="EyeOnSVG" />}
      </button>
    </div>
  );
}
