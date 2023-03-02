import React, {useContext, useState} from 'react';
import {Context} from "../index";
import {Button, Col, Container, Image, Row} from "react-bootstrap";
import {v4} from "uuid";
import BasketNumberOfDevicesInput from "../components/BasketNumberOfDevicesInput";
import {createBasketBuy} from "../http/basketApi";
import {LOGIN_ROUTE} from "../utils/consts";
import {useNavigate} from "react-router-dom";
import {observer} from "mobx-react-lite";



const Basket = observer(() => {
    const {user, device} = useContext(Context)
    let [totalAmount, setTotalAmount] = useState(0)
    const navigate = useNavigate()

    const Pay =()=>{
        const formData = new FormData()
        formData.append('totalAmount', `${totalAmount}`)
        formData.append('basketData', JSON.stringify(user.basket))
        formData.append('basketId', user.userId==="not_authorized"?1:user.userId)
        createBasketBuy(formData).then(() => {})

    }

    const DeleteDeviceBasket=(basketInfo)=>{
        user.setBasket([...user.basket.filter(basketDevice=> basketDevice !== basketInfo)])
    }

    return (
        <Container>
            <Row>
                <Col md={9}>
                    {user.basket.map(basketInfo => {
                            return (
                                <div key={v4()} className="d-flex bd-highlight mb-3"
                                     style={{boxShadow: "0px 0px 3px black", borderRadius: 5, padding: 20}}>
                                    <Image key={basketInfo.defaultValue} className="p-2 bd-highlight" style={{
                                        height: 120, width: 120, marginLeft: 50, boxShadow: "0px 0px 3px black",
                                        borderRadius: 5, padding: 5, margin: 22
                                    }}
                                           src={process.env.REACT_APP_API_URL + basketInfo.img}>
                                    </Image>
                                    <div key={v4()} className="m-auto align-self-center"
                                         style={{paddingRight: 40, fontSize: 40}}>
                                        {device.brands.map(b => b.id === basketInfo.brandId ? b.name : "")} {basketInfo.name}<br/>
                                    </div>
                                    <BasketNumberOfDevicesInput basketInfo={basketInfo} setTotalAmount={setTotalAmount} totalAmount={totalAmount}/>
                                    <Button className="btn" onClick={()=>{DeleteDeviceBasket(basketInfo)}} variant="outline-danger" style={{height:35,width:35,fontSize:15}}>
                                        x
                                    </Button>
                                </div>
                            )
                        }
                    )}
                </Col>
                <Col md={3}>
                    <div style={{boxShadow: "0px 0px 3px black", borderRadius: 5, padding: 20}}>
                        <label  style={{fontSize: 45,fontWeight:200}}>
                            К Оплате: <br/>
                        </label>
                        <label style={{ display:"inline-block", fontSize: 40,fontWeight:400,justifyContent:"center",color: "#007afe"}}>
                        {totalAmount} <label style={{fontSize: 30}}>руб.</label></label>
                        {user.userId!=="not_authorized"?
                            <Button variant="outline-primary" onClick={()=> {
                                Pay()
                            }}> Оплатить</Button>:
                            <Button variant="outline-primary" onClick={()=> {
                                navigate(LOGIN_ROUTE)
                                Pay()
                            }}> Авторизация</Button>
                        }
                    </div>
                </Col>
            </Row>
        </Container>
    );
});

export default Basket;