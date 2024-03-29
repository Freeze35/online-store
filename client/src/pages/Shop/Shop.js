import React, {useContext, useEffect} from 'react';
import DeviceList from "../Device/DeviceList/DeviceList";
import {observer} from "mobx-react-lite";
import {Context} from "../../index.js";
import {fetchBrands, fetchDevices, fetchTypes} from "../../http/deviceApi";
import Pages from "../../components/Pages/Pages";
import SortBar from "../../components/SortBar/SortBar";
import SelectorBar from "../../components/SelectorBar/SelectorBar";
import "./Shop.css"

const Shop = observer(() => {
    const {device, optionDevice} = useContext(Context)
    let limitPages = 8
    //call request for render.com every 10 minutes
    setInterval(()=>{
        fetchDevices(null, null, 1, limitPages)

    },600000)

    //Подключаем наши get запросы на сервер
    // page текущая страница limit относиться к deviceController в котором указываем сколько элементов запрашивать
    useEffect(() => {
        fetchDevices(null, null, 1, limitPages).then(data => {
            device.setDevices(data.rows)
            device.setTotalCount(data.count)
            device.setLimit(limitPages)
            data.rows.map(dev => optionDevice.setTypeBrandListId([...optionDevice.typeBrandListId, {
                typeId: dev.typeId,
                brandId: dev.brandId
            }]))
        })
        fetchTypes().then(data => device.setTypes(data)) // Загружаем типы с сервера
        fetchBrands().then(data => device.setBrands(data)) // Загружаем бренды с сервера
        device.setSelectedBrand([])// Чистка выборки Brand при загрузке
        device.setSelectedType([])// Чистка выборки Type при загрузке

    }, [])

    //Мониторинг изменений брендов или типов(постоянное автоматические запросы)
    /*useEffect(() => {
        fetchDevices(Array.from(new Set(device.selectedType)),
            Array.from(new Set(device.selectedBrand)), device.page,
            8, JSON.stringify(optionDevice.limitPrice)).then(data => {

            device.setDevices(data.rows)
            device.setTotalCount(data.count)
            device.setChangedDevices(data.rows)
        })
    }, [device.page, device.selectedType,device.selectedBrand])*/

    return (
        <div className="shop_block">
            <div className="left_side" >
                <SelectorBar/>
            </div>
            <div className="right_side"
                 id="right_side"
            >
                <SortBar/>
                <DeviceList/>
                <Pages/>
            </div>
        </div>
    );
});

export default Shop;