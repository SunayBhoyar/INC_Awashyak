const mongoose = require("mongoose");
mongoose.set('strictQuery', false);
mongoose.connect("mongodb+srv://INC1234:MCSunay@cluster0.ddicrvg.mongodb.net/INC-Database?retryWrites=true&w=majority").then(()=>{
    console.log("Connected to dataBase")
}).catch((err)=>{
    console.log(err);
})