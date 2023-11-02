
const mongoose = require('mongoose');

const express = require('express');

const authRouter = require("./routes/auth");

const PORT = 3000;
const DB = "mongodb+srv://albqkx:1921141425@eduhome.eskt5gx.mongodb.net/?retryWrites=true&w=majority";

const app = express();

mongoose.connect(DB).then(()=>{
console.log("MONGODB CONNECTED")
})

app.get("/",(req,res)=>{
res.json({msg:"Success"})
})
app.use(express.json());
app.use(authRouter);

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected port ${PORT}`);
});


