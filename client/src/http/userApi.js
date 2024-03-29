import {$authHost, $host} from "./index";
import jwt_decode from "jwt-decode"

export const registration = async (email,password) =>{
    /*const {data} = await $host.post("api/user/registration",{email,password, role:"ADMIN"})
    localStorage.setItem("token",data.token)
    localStorage.setItem("userId",data.id)
    localStorage.setItem("email",email)
    return jwt_decode(data.token)*/
}

export const login = async (email,password) =>{
    /*const {data} = await $host.post("api/user/login",{email,password})
    localStorage.setItem("token",data.token)
    localStorage.setItem("userId",data.id)
    localStorage.setItem("email",email)
    return jwt_decode(data.token)*/
}

export const check = async (email) => {
    try {
        const {data} = await $authHost.get('api/user/auth', {
            params: { email }
        })
        localStorage.setItem('token', data.token)
            return jwt_decode(data.token)
    }
    catch (e) {
        console.log(e)
    }
}