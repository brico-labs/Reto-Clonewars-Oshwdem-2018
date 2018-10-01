var main_gear_Z = 20;
var main_gear_Dp = 31*2; //milimeters
var max_m = 50;
var delta_m = 0.01;
var min_z = 1;
var max_z = 50;

var tolerance = 0.1;

var other_diameters = [56.68*2,62*2,38.31*2]
var solutions = [];

for (z = min_z; z <= max_z; z++ ){
    var m = main_gear_Dp /z;
    pass = true;
    other_diameters.forEach((dp)=>{
        var z = dp / m;
        if (pass && ((z % 1)>tolerance)){
            pass = false;
        }
    })
    if (pass){
        solutions.push(m);
    }

}
solutions.forEach((modulus, index)=>{
    console.log("Solution "+index+", Modulus: "+modulus);
    console.log("Gear 0, Dp: "+ main_gear_Dp.toFixed(2) + " Z: "+ (main_gear_Dp / modulus).toFixed(2))
    other_diameters.forEach((val, index, array)=>{
        console.log("Gear "+(index+1)+", Dp: "+ val.toFixed(2) + " Z: "+ (val / modulus).toFixed(2))
    })
})
