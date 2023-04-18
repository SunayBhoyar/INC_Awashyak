const express = require("express");
const User = require('../models/users');
const Customer = express.Router();
const AuthUser = require("../middleware/UserSide");
const medicine = require("../models/medicine")
const Seller = require("../models/seller")
Customer.post("/Register",async(req,res)=>{
    try{
        const NewUser = new User({
            name:req.body.name,
            mobile:req.body.mobile,
            email:req.body.email,
            password:req.body.password,
            cpassword:req.body.cpassword
        })
        const UserCreated = await NewUser.save();
        const token = await UserCreated.generateAuthToken();
        console.log(token);
        res.send(UserCreated);
    }
    catch(err){
       res.send(err);
    }
})

Customer.post("/SignIn",async(req,res)=>{
    try{
        const email = req.body.email;
        const password = req.body.password;
        const Userfound = await User.findOne({email:email});
        if(Userfound.password===password){
            const token = await Userfound.generateAuthToken();
            console.log(token);
        }
        else{
            console.log("Password Doesn't match");
        }
    }
    catch(err){
        console.log("Invalid Details"+err);
    }
})

Customer.get("/search/:name",AuthUser,async(req,res)=>{
    try{const name = req.params.name;
    const id_Array = await medicine.find({name, Quantity:{$gte:1}},{Shopid:1,_id:0});
    console.log(id_Array);
    var array = [];
    id_Array.forEach(e => {
        array.push(e.Shopid);
    });
    const avail_Sellers = await Seller.find({_id:{$in :array}})
    res.send(avail_Sellers);
    }catch(err){
        console.log(err);
    }
    
})

Customer.get("/search/:name/:quantity",AuthUser,async(req,res)=>{
    try{const name = req.params.name;
        const val = req.params.quantity;
    const id_Array = await medicine.find({name, Quantity:{$gte:val}},{Shopid:1,_id:0});
    console.log(id_Array);
    var array = [];
    id_Array.forEach(e => {
        array.push(e.Shopid);
    });
    const avail_Sellers = await Seller.find({_id:{$in :array}})
    res.send(avail_Sellers);
    }catch(err){
        console.log(err);
    }
    
})
Customer.get("/ViewMedicine/:name/:id",AuthUser,async(req,res)=>{
    try{
        const id = req.params.id;
        const name = req.params.name;
        const medicine_details = await medicine.findOne({name,Shopid:id})
        res.send(medicine_details);
    }catch(err){
        console.log(err)
    }
})

module.exports = Customer;
