const mongoose = require("mongoose");
const validator = require("validator");
const medSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    expiry:{
        type:Date,
        required:true
    },
    Quantity:{
        type:Number,
    },
    Shopid:{
        type:mongoose.Types.ObjectId,
        required:true,
    }
})
const medicine = mongoose.model("medicine",medSchema);
module.exports = medicine;