// Engrenaxe para o reto de impresión 3D da OSHWDen2018
// @tecnoloxia

/*
Ecuacións paramétricas:
http://mathworld.wolfram.com/Hypotrochoid.html
x =   (n * cos(t) + h * cos(n*t/b))
y =   (n * sin(t) - h * sin(n*t/b))

module hypotrochoid(t0,tf,ti,rb,n,h,b,sc)

t0= primeiro valor de t
tf= último valor de t (máximo 360)
ti= intervalo entre t0 e tf
rb= distancia
n, h, b = parámetros da ecuación
sc= escala
*/

module hypotrochoid(t0,tf,ti,rb,n,h,b,sc){    
    for ( t = [t0:ti:tf]){
        x1 = (n * cos(t) + h * cos(n*t/b))*sc;
        y1 = (n * sin(t) - h * sin(n*t/b))*sc;
        x2 = (n * cos((t+ti)) + h * cos(n*(t+ti)/b))*sc;
        y2 = (n * sin((t+ti)) - h * sin(n*(t+ti)/b))*sc;
        tx = (x1+x2)/2;
        ty = (y1+y2)/2;
        ax = x1 - x2;
        ay = y1 - y2;
        translate(v=[tx,ty,0]) rotate(a = [0, 0, -atan2(ax, ay)+90]) square([sqrt(ax*ax+ay*ay),rb],center=true);
        translate(v=[x1,y1,0]) circle(r=rb/2,center=true,$fn=360);
      }
}

altura=10;
radio=49.5;

module figura(){
    scale(2.9) union(){
        hypotrochoid(0,360,0.4,0.8,10,3,2,1);
        hypotrochoid(0,360,0.4,0.8,10,5,2,1);
        hypotrochoid(0,360,0.4,0.8,10,7,2,1);
    }
}

 linear_extrude(altura) union(){
     difference(){
         import ("N31.dxf");
         circle(r= radio-1, $fn=360);
     }
     union(){
         figura();
         difference(){
             circle(r= 10, $fn=6);
             circle(r= 4.5, $fn=360);
         }
     }
}
