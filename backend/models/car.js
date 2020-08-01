const mongoose = require('mongoose')
const carSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },

    fuelType: {
        type: String,
        required: true
    },

    fuelTankSize: {
        type: String,
        required: true
    },

    lastTravelled: {
        type: String,
        default: "Never"
    },

    completedJourney: {
        type: Number,
        default: 0
    },

    distanceCovered: {
        type: Number,
        default: 0
    }
})

module.exports = mongoose.model('Car', carSchema)