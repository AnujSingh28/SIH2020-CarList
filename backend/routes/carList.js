const express = require('express')
const Car = require('../models/car')
const router = express.Router()

//get all
router.get('/', async (req,res) => {
    try{
        const allCars = await Car.find()
        res.json(allCars)
    } catch(err){
        res.status(500).json({message: err.message})
    }
})
//post one
router.post('/', async (req,res) => {
    const newCar = new Car({
        name: req.body.name,
        fuelType: req.body.fuelType,
        fuelTankSize: req.body.fuelTankSize
    })

    try{
        const justAddedCar = await newCar.save()
        res.status(201).json(justAddedCar)
    } catch(err) {
        res.status(400).json({message: err.message})
    }
})

//update one
router.patch('/', (req,res) => {

})

//delete one
router.delete('/', (req,res) => {

})


module.exports = router