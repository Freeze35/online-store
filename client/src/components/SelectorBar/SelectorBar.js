import React, {useContext, useEffect, useState} from 'react';
import {observer} from "mobx-react-lite";
import {Context} from "../../index.js";
import TypeAccordion from "./TypeAccordion";
import BrandAccordion from "./BrandAccordion";
import PriceAccordion from "./PriceAccordion";
import Scrollbars from "react-custom-scrollbars-2";
import "./accordion.css"
import "./SelectorBar.css"
import search_loop from "../../assets/Search_Loop.svg"
import resizeHelper from "../helpers/resizeHelper";

const SelectorBar = observer(() => {
    const {device, optionDevice} = useContext(Context)
    //const [widthIn,setWidthIn] =useState(window.innerWidth)
    /*useEffect(()=>{
        console.log(window.innerWidth)
    },[window.innerWidth])*/
    const [windowWidth, setWindowWidth] = useState(window.innerWidth);

    const ClearTypes = () => {
        device.selectedType.map(selType => {
            device.types.map(type => {
                    if (type.id === selType) {
                        document.getElementById(`${type.id}sel_type${type.name}`).click()
                    }
                }
            )
        })

    }

    resizeHelper(setWindowWidth)


    useEffect(() => {
        ClearTypes()
        if (windowWidth < 768) {
            document.getElementById("selector_div").className = "selector_div_closed"
        }
        else {
            document.getElementById("selector_div").className = "selector_div"
        }
    }, [windowWidth])


    const closeDetailedSearch = () => {
        //
        if (document.getElementById("selector_div").className === "selector_div") {
            document.getElementById("selector_div").className = "selector_div_closed"
            document.getElementById("right_side").style.display = ""

        } else {
            document.getElementById("selector_div").className = "selector_div"
            ClearTypes()
            //when open 768 search none items shows
            document.getElementById("right_side").style.display = "none"
        }

    }

    return (
        <div>
        <div className="upper_selector_div">
            <div className="selector_div" id="selector_div">
                {windowWidth < 768
                    ? <Scrollbars>
                        {device.types.map((type) => {
                            return (
                                <TypeAccordion key={`${type.name}op${type.id}`} type={type} device={device}
                                               optionDevice={optionDevice}>
                                    <BrandAccordion key={`${type.name}sop${type.id}`} device={device} type={type}
                                                    optionDevice={optionDevice}/>
                                    <hr/>
                                    <PriceAccordion key={`${type.name}pop${type.id}`} type={type}/>
                                </TypeAccordion>
                            )
                        })}
                    </Scrollbars>

                    : device.types.map((type) => {
                        return (
                            <TypeAccordion key={`${type.name}op${type.id}`} type={type} device={device}
                                           optionDevice={optionDevice}>
                                <BrandAccordion key={`${type.name}sop${type.id}`} device={device} type={type}
                                                optionDevice={optionDevice}/>
                                <hr/>
                                <PriceAccordion key={`${type.name}pop${type.id}`} type={type}/>
                            </TypeAccordion>
                        )
                    })
                }

            </div>
        </div>
    <div className="detailed_search" onClick={closeDetailedSearch}>
       <img className="img_search" src={search_loop} alt="{search_loop}"></img> Подробный поиск
    </div>
    </div>

    );
});

export default SelectorBar;
