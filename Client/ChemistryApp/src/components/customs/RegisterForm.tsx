import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { Button } from "../ui/button";
import useAuthStore from "../../Store/authStore";
import { useNavigate } from "react-router-dom";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "../ui/form";
import { Input } from "../ui/input";
import { Link } from "react-router-dom";
import PasswordInput from "./PasswordInput";
// declare form schema for register
const formSchema = z.object({
  email: z.string().email({ message: "Invalid email" }),
  full_name: z.string().min(5, { message: "Full name is required" }),
  password_hash: z
    .string()
    .min(8, { message: "Password must be at least 8 characters" }),
});
// Create RegisterForm component
const RegisterForm = () => {
  const navigate = useNavigate();
  const register = useAuthStore((state) => state.register);
  const isAuthenticated = useAuthStore((state) => state.isAuthenticated);
  // useForm hook to handle form state and validation
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: "",
      full_name : "",
      password_hash: "",
    },
  });
  // handle form submission
  const handleSubmit = async (values: z.infer<typeof formSchema>) => {
    await register(values.email, values.full_name, values.password_hash);
    if (isAuthenticated) {
      navigate("/login");
    }
    form.reset();
  };
  // render form
  return (
    <Form {...form}>
      <form className="w-full max-w-sm flex flex-col gap-4 justify-center" onSubmit={form.handleSubmit(handleSubmit)}>
        <FormField
          control={form.control}
          name="email"
          render={(field) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input type="email" {...field.field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="full_name"
          render={(field) => (
            <FormItem>
              <FormLabel>Full Name</FormLabel>
              <FormControl>
                <Input type="text" {...field.field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="password_hash"
          render={(field) => (
            <FormItem>
              <FormLabel>Password</FormLabel>
              <FormControl>
                <PasswordInput {...field.field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
       <div className="flex justify-end mt-4">
        <Link className="text-Primary" to={"/ForgotPassword"}>Forgot password?</Link>
       </div>
        <Button className="mt-4 bg-Primary" type="submit">
          Register
        </Button>
        <p className="text-sm text-gray-500 text-center mt-4">
            Already have an account? <Link to="/login" className="text-Primary">Login</Link>
        </p>
      </form>
    </Form>
  );
};

export default RegisterForm;
