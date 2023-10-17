const express = require('express')
const {engine} = require('express-handlebars')

const PORT = parseInt(process.env.PORT) || 3001

const app = express()

app.listen(PORT, ()=>{
    console.info(`Application started on port ${PORT} at ${new Date()}`)
})

