import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { Button } from "../ui/button";
import useAuthStore from "../../Store/authStore";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "../ui/form";
import { Input } from "../ui/input";
const formSchema = z.object({
  email: z.string().email({ message: "Invalid email" }),
  password_hash: z
    .string()
    .min(8, { message: "Password must be at least 8 characters" }),
});
const LoginForm = () => {
  const login = useAuthStore(state => state.login);
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: "",
      password_hash: "",
    },
  });
  const handleSubmit = (values: z.infer<typeof formSchema>) => {
    login(values.email, values.password_hash);
    form.reset();
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(handleSubmit)}>
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
                <Input type="password" {...field.field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button className="float-right mt-2" type="submit">Login</Button>
      </form>
    </Form>
  );
};

export default LoginForm;
