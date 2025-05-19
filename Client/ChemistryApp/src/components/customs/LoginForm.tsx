import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { Button } from "@/components/ui/button";
import useAuthStore from "@/Store/authStore";
import { useNavigate } from "react-router-dom";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Link } from "react-router-dom";
import PasswordInput from "@/components/customs/PasswordInput";
import { useEffect } from "react";
// declare form schema for login
const formSchema = z.object({
  email: z.string().email({ message: "Invalid email" }),
  password_hash: z
    .string()
    .min(8, { message: "Password must be at least 8 characters" }),
});
// Create LoginForm component
const LoginForm = () => {
  const navigate = useNavigate();
  // get login funct  and isAuthenticated from AutStore 
  const login = useAuthStore((state) => state.login);
  const isAuthenticated = useAuthStore((state) => state.isAuthenticated);
  // useForm hook to handle form state and validation
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: "",
      password_hash: "",
    },
  });
  // handle form submission
  const handleSubmit = async (values: z.infer<typeof formSchema>) => {
    await login(values.email, values.password_hash);
    form.reset();
  };
  useEffect(() => {
    if (isAuthenticated) {
      navigate("/Chemiscal");
    }
  }, [isAuthenticated, navigate]);
  // render form
  return (
    <Form {...form}>
      <form
        className="w-full max-w-sm flex flex-col gap-4 justify-center"
        onSubmit={form.handleSubmit(handleSubmit)}
      >
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
          <Link className="text-Primary" to={"/ForgotPassword"}>
            Forgot password?
          </Link>
        </div>
        <Button className="mt-4 bg-Primary" type="submit">
          Login
        </Button>
        <p className="text-sm text-gray-500 text-center mt-4">
          Don't have an account?{" "}
          <Link to="/register" className="text-Primary">
            Register
          </Link>
        </p>
      </form>
    </Form>
  );
};

export default LoginForm;
