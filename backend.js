function displayScore(num){
    if(num < 10){
        return "#00000" + num
    } else if(num <100 ){
        return "#0000" + num
    } else if(num < 1000){
        return "#000" + num
    } else if(num < 10000){
        return "#00" + num
    } else if(num < 10000){
        return "#0" + num
    } else if(num < 100000){
        return "#" + num
    }else if(num === 999999){
        return "#999999" + num
    } else {
        return "error"
    }
}

    function getColor() {
        var colors = ["#69eedd", "#009aca","#fb345f","#ff9376"]
        x=Math.floor(Math.random() * (3 - 0 + 1)) + 0;
        return colors[x];
    }

