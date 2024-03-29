import {makeAutoObservable} from "mobx";

export default class DeviceStore {
    constructor() {
        this._types = []
        this._brands = []
        this._devices = []
        this._selectedType = []
        this._selectedBrand = []
        this._page = 1
        this._totalCount = 0
        this._limit = 8
        this._expand=false
        this._changedDevices = []
        this._searchOption=''
        this._minPrice=0
        this._maxPrice=0
        makeAutoObservable(this)
    }

    setTypes(types) {
        this._types = types
    }

    setBrands(brands) {
        this._brands = brands
    }

    setSelectedBrand(brand) {
        this.setPage(1)
        this._selectedBrand = brand
    }

    setDevices(devices) {
        this._devices = devices
    }

    setChangedDevices(changedDevices) {
        this._changedDevices = changedDevices
    }
    setSelectedType(type) {
        this.setPage(1)
        this._selectedType = type
    }

    setPage(page) {
        this._page = page
    }

    setTotalCount(count) {
        this._totalCount = count
    }

    setExpand(expand) {
        this._expand = expand
    }

    setSearchOption(searchOption) {
        this._searchOption = searchOption
    }

    setMinPrice(minPrice) {
        this._minPrice = minPrice
    }

    setMaxPrice(maxPrice) {
        this._maxPrice = maxPrice
    }

    setLimit(limit) {
        this._limit = limit
    }

    //Getters
    get types() {
        return this._types
    }

    get brands() {
        return this._brands
    }

    get selectedBrand() {
        return this._selectedBrand
    }

    get devices() {
        return this._devices
    }

    get changedDevices() {
        return this._changedDevices
    }

    get selectedType() {
        return this._selectedType
    }

    get totalCount() {
        return this._totalCount
    }

    get page() {
        return this._page
    }

    get limit() {
        return this._limit
    }

    get expand() {
        return this._expand
    }

    get searchOption() {
        return this._searchOption
    }

    get minPrice() {
        return this._minPrice
    }

    get maxPrice() {
        return this._maxPrice
    }
}