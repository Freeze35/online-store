import React, {useState} from 'react';

import Scrollbars from "react-custom-scrollbars-2";
import {observer} from "mobx-react-lite";

const TypeAccordion = observer(({children,device,type,optionDevice}) => {
    const [open, setOPen] = useState(false)

    const typeCheckHeader = (e, type) => {
        setOPen(!open)
        let expanded = document.getElementById(`${type.id}t${type.name}`)
            .getAttribute("class")==="button-accordion-closed"

        if (expanded && device.selectedType.length) {
            device.selectedType.map(i => {
                if (i === type.id) {
                    device.setSelectedType(device.selectedType.map(i => i).filter(i => i !== type.id))
                } else if (expanded) {
                    device.setSelectedType(Array.from(new Set([...device.selectedType, type.id])))
                }
            })

        } else if (device.selectedType.length) {
            device.selectedType.map(i => {
                if (i === type.id) {
                    device.setSelectedType(device.selectedType.map(i => i).filter(i => i !== type.id))
                    //click on brand Button in sliderType
                    if (document.getElementById(`${type.id}w1${type.name}`)
                            .getAttribute("aria-expanded") === "true")
                    {document.getElementById(`${type.id}w1${type.name}`).click()}
                    //clear all marks brand in closed in sliderType
                    device.brands.find(brand => {
                        if (document.getElementById(`${type.id}_${brand.id}`) !== null &&
                            optionDevice.specialID.find(id => id === `${type.id}_${brand.id}`)) {
                            document.getElementById(`${type.id}_${brand.id}`).click()
                        }
                    })
                    //click on price Button in sliderType
                    if (document.getElementById(`${type.id}p_a_button${type.name}`)
                        .getAttribute("class") === "button-accordion")
                    {document.getElementById(`${type.id}p_a_button${type.name}`).click()}
                    //clear price selector
                }
            })

        } else if (expanded) {
            device.setSelectedType(Array.from(new Set([...device.selectedType, type.id])))
        }
    }

    return (

        <div key={`${type.id}axcddf${type.name}`} style={{paddingTop:10}}>
            <button className={open?"button-accordion":"button-accordion-closed"}
                    key={`${type.id}t${type.name}`}
                    id={`${type.id}t${type.name}`}
                    onClick={(e) => {
                        typeCheckHeader(e, type)
                    }}>
                {type.name}
            </button>
            <hr/>
            <div key={`${type.id}a__a${type.name}`} className={open?"accordion-box-expanded":"accordion-box"} id={`${type.id}a__a${type.name}`}>
                <Scrollbars style={{height: 300, width: "auto",minWidth:210}}>
                    <div key={`${type.id}a__abb${type.name}`}>
                        {children}
                    </div>
                </Scrollbars>
            </div>
        </div>)
});

export default TypeAccordion;