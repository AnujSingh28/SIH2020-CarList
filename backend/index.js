require('dotenv').config()
const express = require('express')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const http = require('http')

const app = express()
mongoose.connect(process.env.DATABASE_URL, { useNewUrlParser : true , useUnifiedTopology: true });
const db = mongoose.connection;
db.on('error', (error) => { console.error(error)});
db.once('open', () => {console.log("DB opened bruuuuhhhhhhh!!!!")});

const hostname = '127.0.0.1';
const port = 4000;

// const server = http.createServer((req, res) => {
//   res.statusCode = 200;
//   res.setHeader('Content-Type', 'text/plain');
//   res.end('Hello World\n');
// });
// server.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`);
// });

app.use(express.json())

const carListRouters = require('./routes/carList')
app.use('/carList', carListRouters)


app.listen(port, function(){
  console.log("server started at 4000")
});