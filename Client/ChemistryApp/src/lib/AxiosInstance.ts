import axios from "axios";

const axiosInstance = axios.create({
    baseURL : "http://18.141.164.54:8080/"
})

export default axiosInstance ;
