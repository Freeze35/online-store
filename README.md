# Проект онлайн магазина на основе:

## [Online-store-netfly](https://store-petr-elshin-github-freeze35.netlify.app/shop)
## React,Express,PostgerSQL,Node.js
## Также для frontend части соберём реакт приложение с помощью webpack
### Для запуска потребуется установить PostgerSQL и Node.js
### После чего запустить npm run dev или npm run server(запустит сам сервер отдельно). Произойдёт инициализация таблиц хранения данных.
## В папке храниться Бд для импорта в ## Pg server/RestoreDataBasePGSQL/online-store.sql
### [Как импортировать sql file in PGSQL](https://www.youtube.com/watch?v=3AKIA8pu8YY)  
    Сейчас порт сервер установлен на мок сервер с портом 3000
    для подключения к стандартному PGSQL port = 5001 server
    client .env port-server = 3000
    Команды для старта приложения,
    Также запуска клиента и сервера отдельно.
    В папке уже находиться собранный frontend react webpack 
    build Для пересборки webpack frontend 
    Готовый проект находиться в папке dist
    startprod:webpack Для просмотра готовой сборки запустите 

    "server": "npm run dev --prefix server",
    "client": "npm run start --prefix client",
    "start-reactClient-postServer": "start npm run server && start npm run client",
    "start-webpack-dev": "npm run start-webpack-devServer --prefix client",
    "start-webpack-prod": "start-webpack-prodServer --prefix client",
    "startPostServer": "npm run start --prefix server",
    "build-webpack-prod": "build-webpack-prod --prefix client"
# Backend(server)
## express
Запуск серверной маршрутизации.  
Маршрутизация определяет, как приложение отвечает на клиентский запрос к конкретному адресу (конечной точке), которым является URI (или путь), и определенному методу запроса HTTP (GET, POST и т.д.).  
Каждый маршрут может иметь одну или несколько функций обработки, которые выполняются при сопоставлении маршрута.  
https://expressjs.com/ru/

## pg
https://www.npmjs.com/package/pg  
PostgerSQL  
Чистый клиент JavaScript и собственные привязки libpq используют один и тот же API  
Пул соединений  
Расширяемый JS↔Приведение типов данных PostgreSQL  
Поддерживаемые функции PostgreSQL  

## pg-hstore
https://www.npmjs.com/package/pg-hstore  
Пакет узлов для сериализации и десериализации данных JSON в формат hstore.  

## sequelize
это Node.js на Object Relational Mapper , который упрощает работу с базами данных MySQL, MariaDB, SQLite, PostgreSQL и другими.  
https://sequelize.org/  
sequelize Позволаяет легко прописать параметры подключения к БД  
(.env) - Все данные для подключения  
(db.js) - Прописываем все параметры для подколючения.  
(const sequelize = require('./db')) - В фале index.js запрашиваем параметры для атентификации  
const startserver = async () =>{  
try{  
await sequelize.authenticate() - соответсвенное подключения БД  
await sequelize.async() - сверяет состояние схемы данных  
} catch  
В файле models создаем схемы для SQL базы данных и связи между ними  
Запрашиваем типы данных SQL из sequelize  
const {DataTypes} = require('sequelize')   

## cors
CORS — это пакет node.js для предоставления промежуточного программного обеспечения Connect / Express , 
которое можно использовать для включения CORS с различными параметрами.
[Ссылка на понимаении CORS](https://learn.javascript.ru/fetch-crossorigin)

## dotenv
Dotenv — это модуль с нулевой зависимостью, который загружает переменные среды из .env файла в файлы process.env.

## express-fileupload
Когда вы загружаете файл, он будет доступен из req.files

## jsonwebtoken
библиотека для генерации JWT токена
## bcryptjs-react
Шифрование JWT токена

# Frontend(client)

## npm install

## axios
Это HTTP-клиент, основанный на Promise для node.js и браузера. 
Он изоморфный (= он может работать в браузере и node.js с той же базой кодов).

## react-router-dom
Пакет react-router-dom содержит привязки для использования React Router в веб-приложениях.

## mobx
Слежение за компонентами перерндер в случае изменения компонента
client/store, constructor => makeAutoObservable(this) 
// не использовать makeObservable

## mobx-react-lite
observer - слежение за изменением параметров переданного элемента в AppRouter
makeAutoObservable(this) слежение за изменением параметров в самом контрукторе UserStore
## react-bootstrap client
https://getbootstrap.com/docs/5.0/utilities/spacing/  Margin and padding(Внешние и внутренние отступы)
https://getbootstrap.com/docs/5.0/utilities/flex/ Flex(растягивание или выравнивание элемента на странице)
https://mdbootstrap.com/docs/react/utilities/spacing/ Spacing

## jwt-decode
https://www.npmjs.com/package/jwt-decode
Это небольшая библиотека браузера, которая помогает декодировать токен JWT, закодированный Base64Url.

## Связывание посредством Interceptors(Перехватчиками http/index.js) 
Вы можете перехватывать запросы или ответы до того, как они будут обработаны try,then или catch.
https://axios-http.com/docs/interceptors

## react-slider
В данном случае слайдер для ценового диапазона RangeSlider => SelectorBar.js
## react-custom-scrollbars-2
Custom scrollbar для react <Scrollbars>
## uuid
генерируюет случайны id для того чтобы имена файлов были уникальными
Не рекомендуется использовать для вложенных изменяющихся элементов с
индивидуальным состоянием к примеру в SelectorBar.js
setOpen вложенный элемент Toggle
поэтому формируются ключи из входных параметров (exemplar type)
Также это косается передачи в дочерние эелементы
``` 
 map(type =>
<Toggle key={v4()} type={type}/> 
<Toggle key={`${type.id}w${type.name}`} type={type}/> 
)
```

### WEBPACK

## webpack
 [webpack](https://webpack.js.org/guides/getting-started/#using-a-configuration)  
Инструмент для сборки JS приложений.  
Позволяет собирать проект в один общий в папке dist  
Посредством указания в файле webpack.config.js loader
 @babel/preset-env',"@babel/preset-react 
При инициализации модуля следуеет ссылаться на входной js => index.js файл
Исправление ошибок при сборке bundle
 [async_hooks error](https://stackoverflow.com/questions/71484777/module-not-found-cant-resolve-async-hooks)  
 [buffer assert error](https://stackoverflow.com/questions/61631937/cant-resolve-buffer-in-c-portal-node-modules-string-decoder-node-modules-s)  
 [crypto,os,browser and another. Or we can just add to wenbpack.config.js 
 resolve: fallback: fs,os,...: false,
](https://stackoverflow.com/questions/64557638/how-to-polyfill-node-core-modules-in-webpack-5)  
[Module not found : net](https://stackoverflow.com/questions/54275069/module-not-found-error-cant-resolve-net-in-node-modules-stompjs-lib)  
[Webpack WARNING in ./node_modules/express/lib/view.js, externals: {
express: 'express'}](https://stackoverflow.com/questions/50105076/webpack-warning-in-node-modules-express-lib-view-js-critical-dependency-the-r)
## dotenv-webpack
[Если подключаете сборку на основе Webpack потребуется dotenv-webpack ](https://stackoverflow.com/questions/59759085/heroku-failed-to-load-env)  
Он предоставляет распознание файлов .env из корня проекта 
## webpack-cli
[webpack-cli](https://www.npmjs.com/package/webpack-cli)  
Для доступа к некоторым командам веб-пакета через CLI, таким как запуск сервера разработки, создание рабочей сборки и т. д.
## webpack html-webpack-plugin clean-webpack-plugin
[html-webpack-plugin](https://webpack.js.org/plugins/html-webpack-plugin/)
[clean-webpack-plugin](https://webpack.js.org/plugins/html-webpack-plugin/)
Упрощает создание файлов HTML для обслуживания ваших пакетов веб-пакетов.
## --save-dev style-loader css-loader scss-loader less-loader filer-loader
Loaders for webpack файлы которые распознает webpack для компиляции  
рекомендуется только как dev зависисмость
## babel-loader
[babel](https://babeljs.io/setup#installation)
## @babel/preset-react
[Webpack: Bundle.js — Uncaught ReferenceError](https://stackoverflow.com/questions/41359504/webpack-bundle-js-uncaught-referenceerror-process-is-not-defined)  
## babel/preset-env
Исправление ошибки запуска React App
Если вы используете Babel и React >17, вам может понадобиться добавить «runtime»  
[["@babel/preset-react", {"runtime": "automatic"}]](https://stackoverflow.com/questions/32070303/uncaught-referenceerror-react-is-not-defined)
## babel/polyfill
[babel/polyfill](https://babeljs.io/docs/babel-polyfill)
## babel-loader
[babel-loader](https://webpack.js.org/loaders/babel-loader/)
## Невозможно загрузить файл ps1
[Решение](https://zawindows.ru/%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5-%D0%BF%D1%80%D0%BE%D0%B1%D0%BB%D0%B5%D0%BC%D1%8B-%D0%BD%D0%B5%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE-%D0%B7%D0%B0%D0%B3%D1%80%D1%83%D0%B7/)
Скрипт для Windows:  
Set-ExecutionPolicy unrestricted

## [Mocker-api](https://www.npmjs.com/package/mocker-api?activeTab=readme) Moker-Api For concetion mocker server
If we wanted connecting to our local store PostgreSQL change our client/.env file  
REACT_APP_API_URL="http://localhost:5001/"  
Creating options for server  using webpack or a
call api.app or another calling value (api,..) api.app  
end set path to our file mocker (api)  
CRUD server set in client/mocker/api.js
```
devServer: {
        onBeforeSetupMiddleware(api){
            apiMocker(api.app, path.resolve('./mocker/api.js'),
                {
                    proxy: {
                        '/repos/(.*)': 'https://api.github.com/',
                    },
                    changeHost: true,
                })
        }
    },
```

## Adding mocker-server
add in mocker-server/index.js for reading request url  
```app.use(express.urlencoded({ extended: true }));```    
by standard app.use(express.json()) for PSQL  
Send our server on Vercel   
It's server for App  
Now for requests in client/env we're setting new path REACT_APP_API_URL  
[device/api example](https://online-store-mocker-server.vercel.app/api/device)
mocker_server/mocker/devicesApi.json

## Adding server on render.com
confirmed on 10.05.2023  
Default port for express server deploy 10000 !IMPORTANT  
Unfortunately, deploying a web service on USA servers gives numerous failures. Preference Singapore or Europe  
Using only res.headers for server policy instead default app.cors({'*''})  

### [CORS Problem](https://stackoverflow.com/questions/73931111/getting-no-access-control-allow-origin-cors-error-but-the-header-is-set-and-work)
Replace express().use(cors())
Adding allow origin for working with fileSystem

```
app.use(function(req, res, next) {
    // res.header("Access-Control-Allow-Origin", "*");
    const allowedOrigins = ['*','http://localhost:3000', 'https://store-petr-elshin-github-freeze35.netlify.app'];
    const origin = req.headers.origin;
    if (allowedOrigins.includes(origin)) {
        res.setHeader('Access-Control-Allow-Origin', origin);
    }
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
    res.header("Access-Control-Allow-credentials", true);
    res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, UPDATE");
    next();
});
```

### PM2 for production
for deploy on render.com use script [pm2-runtime](https://community.render.com/t/deploy-to-render-web-service-with-pm2/5556) watch for reloading onchange data  
```pm2-runtime start ./index.js --watch```
[difference between pm2 and pm2-runtime](https://stackoverflow.com/questions/53962776/whats-the-difference-between-pm2-and-pm2-runtime)
[Article for connecting process manager](https://habr.com/ru/articles/480670/)

## Progressive loading react-progressive-graceful-image
[png supports browsers](https://caniuse.com/?search=png)  
Progressive loading image from small to large resolution   
[Прогрессивные изображения](https://www.youtube.com/watch?v=mXxU_kGm_BQ&ab_channel=%D0%9C%D0%B8%D1%85%D0%B0%D0%B8%D0%BB%D0%9D%D0%B5%D0%BF%D0%BE%D0%BC%D0%BD%D1%8F%D1%89%D0%B8%D0%B9)

## Ремарка подключения fonts and Optimizing images
[Таким образом, браузеры, поддерживающие предварительную загрузку, будут предварительно загружать woff2 // So browsers that support preloading will preload woff2
](https://stackoverflow.com/questions/1330825/preloading-font-face-fonts)
[connect fonts](https://www.youtube.com/watch?v=GwA0BN5RgB0)  
В файле fontface.css описываем подключаемые шрифты для разных систем  
экспортируем к нашему центральному App.css и  
объявляем на глобальном уровне именно этот font  //  
In the fontface.css file, we describe the included fonts for different systems
export to our central App.css and
we declare at the global level exactly this font  serif for default
```
*{
font-family: Rubik-Regular, serif;}
```

for optimize images =>
use resolution picture 1920 1280 or on choice author[better]
changing in any redactor of picture   
=>
compress (reduce 50-90% size) our image [compresspng.com](https://compresspng.com/)  
=>  
for better optimaztion ready image use | recommended WEBP format of picture [squoosh](https://squoosh.app/)

для отдельных изображений для ускорения подгрузки лучше использовать loading="lazy"[loading="lazy"](https://stackoverflow.com/questions/69054825/how-should-i-implement-lazy-loading-for-my-images-in-react)

```
<img className="book_image"
     src={TakeDataBookComponent("imageBook",book)}
     alt={""}
     loading="lazy"
/>
```

## Add change txt file to json and add to any deviceFile
Учитываются пробелы при разделение Head and Characters[key,value]  
Пустые строки для разделения Head первый может иметь только нижний пропуск  
Characters.txt and ChangeTxt.json  
Затем приобразуем файл txt используя команду node src/components/helpers/ReadText.mjs или node_to_json  
Заходим на строницу device/{id} => Добавить свойство => Добавить файл(Сам считает ChangeTxt.json) => Сохранить [Временное решение будет обрабатываться на серверной части]  

Characters.txt example:
```
Габариты и вес

Ширина
70.9 мм
Высота
146.1 мм
Толщина
9.5 мм
Вес
160 г

Питание

Тип аккумулятора
Li-polymer
Емкость аккумулятора
2600 мАч
Съемный аккумулятор
есть
Выходная мощность ЗУ
5 Вт
Поддержка быстрой зарядки
нет
Поддержка беспроводной зарядки
Нет
```

