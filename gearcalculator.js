

// Primitive diameter of the base gear
var main_gear_Dp = 31*2; //milimeters
// Minimum number of teeth
var min_z = 1;
// Maximum number of teeth
var max_z = 50;

// Tolerance in the number of teeth
var tolerance = 0.1;

// Primitive diameters of the other gears
var other_diameters = [56.68*2,62*2,38.31*2]

// Empty array for the solutions
var solutions = [];

// Iterate over the number of teeth
for (z = min_z; z <= max_z; z++ ){
    // Compute modulus for that number of teeth
    var m = main_gear_Dp /z;

    pass = true;

    // Check if all the other gears are in the acceptable tolerance
    other_diameters.forEach((dp)=>{
        // Compute number of teeth
        var z = dp / m;
        if (pass && ((z % 1)>tolerance)){
            pass = false;
        }
    })

    // If all the gears passed the tolerance test, add to the solutions array
    if (pass){
        solutions.push(m);
    }

}

// Print the solutions
solutions.forEach((modulus, index)=>{
    console.log("Solution "+index+", Modulus: "+modulus);
    console.log("Gear 0, Dp: "+ main_gear_Dp.toFixed(2) + " Z: "+ (main_gear_Dp / modulus).toFixed(2))
    other_diameters.forEach((val, index, array)=>{
        console.log("Gear "+(index+1)+", Dp: "+ val.toFixed(2) + " Z: "+ (val / modulus).toFixed(2))
    })
})
