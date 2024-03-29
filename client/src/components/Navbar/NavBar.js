import React, {useContext} from 'react';
import {NavLink, useNavigate} from "react-router-dom";
import {ADMIN_ROUTE, BASKET_ROUTE, LOGIN_ROUTE, SHOP_ROUTE} from "../../utils/consts";
import {Context} from "../../index.js";
import {observer} from "mobx-react-lite";
import SearchBar from "../SearchBar/SearchBar";
import basket_white from "../../assets/basket_icon_white.png"
import "./NavBar.css"

const NavBar = observer(() => {
    const {user} = useContext(Context)
    let navigate = useNavigate()

    const logOut = () => {
        user.setUser({})
        user.setIsAuth(false)
        localStorage.removeItem('token')
        localStorage.removeItem('email')
        user.setUserId("not_authorized")
    }

    return (
        <div className="navbar_box" id="navbar_box">
            <div className="inside_navbar_block">
                <div>
                    <NavLink to ={SHOP_ROUTE} className="nav_link">
                        Магазин
                    </NavLink>
                    <NavLink to ={SHOP_ROUTE} className="nav_link">
                        О нас
                    </NavLink>
                </div>
                {user.isAuth && user.userId!=="not_authorized"
                    ? <SearchBar className="high_res_search not_auth"/>
                    : <SearchBar className="high_res_search"/>}
                <div>
                    {user.isAuth && user.userId!=="not_authorized"
                        ?<div>
                                <img className="basket_img" src={basket_white}
                                     onClick={()=>navigate(BASKET_ROUTE+"/"+(user.userId))} alt=""/>
                                <button className="auth_button auth_margin_right" onClick={()=> {
                                    navigate(ADMIN_ROUTE)
                                }} >
                                    Админ панель
                                </button>
                                <button className="auth_button"  onClick={() => logOut()}>
                                    Выйти
                                </button>
                            </div>
                        :
                        <div>
                            <img className="basket_img" src={basket_white}
                                 onClick={()=>navigate(BASKET_ROUTE+"/"+(user.userId))} alt=""/>
                            <button className="auth_button" onClick={()=>navigate(LOGIN_ROUTE)}>Авторизация</button>
                        </div>

                    }
                </div>
            </div>
            <div className="collapsed_search_div input_form">
                <SearchBar className="collapsed_search"/>
            </div>
        </div>
    );
});

export default NavBar;