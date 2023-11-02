

const User  = require("../models/user")
const authRouter = require('express').Router();
const bcrypt = require("bcrypt");

authRouter.post("/api/signup",async (req,res)=>{
   const {name,email,password} = req.body;
    
try{
const existingUser = await User.findOne({email});

if(existingUser){
    return res.status(400).json({msg:"User with same email exists"});
}

const hashedPassword = await bcrypt.hash(password,8)

  let user = new User({name,email,password:hashedPassword});

  user = await user.save();
  res.json(user);

}
catch(error){
res.status(500).json({msg:"Invalid email"})
}

})



module.exports = authRouter;