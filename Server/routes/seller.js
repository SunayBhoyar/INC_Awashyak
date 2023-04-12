const cookieParser = require("cookie-parser");
const express = require("express");
const seller = require('../models/seller');
const jwt = require("jsonwebtoken");
const Shop = express.Router();
const AuthSeller = require("../middleware/SellerSide")
const medicine = require("../models/medicine");
//SignUp method
Shop.post("/Signup",async(req,res)=>{
    try{
        const NewSeller = new seller({
            name:"Pranav",
            shopName:"MCSunay",
            address:"PICT", 
            mobile:9979731378,
            email:"j7a@gmail.com",
            licence:"N5IL",
            password:"Pranav",
            cpassword:"Pranav"
        })
        
        const SellerCreated = await NewSeller.save();
        console.log(SellerCreated);
        const token =  await SellerCreated.generateAuthToken();
        console.log(token);
        //res.cookie("jwt",token,{expires:new Date(date.now() + 80000),httpOnly:true});

    }
    catch(err){
        console.log(err);
    }
})

//Login Function
Shop.post("/login",async(req,res)=>{
    try{
        const email = req.body.email;
        const Userfound = await seller.findOne({email:email});
        const password = req.body.password;
        if(password===Userfound.password){
            const token = await Userfound.generateAuthToken();
            console.log(token);
            //res.cookie("jwt",token,{expires:new Date(date.now() + 80000),httpOnly:true});
            
            
        }
        else{
            res.send("Invalid Details")
        }

    }catch(err){
        res.status(401).send("Invalid Details");
    }
})

//for Seller to Add medicine in to the database
Shop.post("/AddMed",AuthSeller,async(req,res)=>{
    try{const token = req.header("Authorization").replace("Bearer ", "");
    const verifySeller = jwt.verify(token,process.env.SECRET_KEY);
    const SellerFound = await seller.findOne({_id:verifySeller._id});
    const NewMedicine = new  medicine({
        name:req.body.name,
        expiry:req.body.expiry,
        Quantity:req.body.Quantity,
        Shopid: SellerFound._id
    })
    const Addmedicine = await NewMedicine.save();
    console.log(Addmedicine);
    }catch(err){
       console.log(err);
    }
})

//For Seller to see his Medicines
Shop.get("/getMed/:id",AuthSeller,async(req,res)=>{
    try{
    const id = req.params.id;
    console.log(id);
    const med = await medicine.find({Shopid:id});
    res.send(med);
    }
    catch(err){
        console.log(err);
    }
})

//For Seller to Update his medicine
Shop.patch("/UpdateMed/:id",AuthSeller,async(req,res)=>{
    try{
        const id = req.params.id;
        const Updated = await medicine.findByIdAndUpdate({_id:id},req.body,{new:true});
        res.send(Updated);

    }catch(err){
        console.log(err);
    }
})

//For Seller to Delete his Medicine
Shop.delete("/DeleteMed/:id",AuthSeller,async(req,res)=>{
    try{
        const id = req.params.id;
        const Deleted = await medicine.findByIdAndDelete({_id:id});
        res.send(Deleted);
    }catch(err){
        console.log(err);
    }
})


module.exports = Shop;